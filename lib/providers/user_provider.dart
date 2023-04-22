import 'dart:convert';
import 'dart:developer';

import 'package:ball_dont_lie/common/navbar/navbar.dart';
import 'package:ball_dont_lie/models/user.dart';
import 'package:ball_dont_lie/utils/error-handle.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;

  static bool didSignOut = false;

  User _user =
      User(id: '', email: '', password: '', token: '', selectedLeagues: []);

  User get user => _user;

  void setUser(String user) {
    _user = User.fromString(user);
    notifyListeners();
  }

  // Future<void> fetchAndSetusers() async
  // {
  //   CollectionReference _collectionRef =FirebaseFirestore.instance.collection('users');
  //   QuerySnapshot allDataQuerySnapshot = await _collectionRef.get();
  //   users = allDataQuerySnapshot.docs
  //       .map((doc) => doc.data())
  //       .toList()
  //       .map((e) => model.User.fromJson(e as Map<String, dynamic>))
  //       .toList();
  //   log(users.length.toString());
  //   notifyListeners();
  // }

  // Future<void> adduser(model.User t) async
  // {
  //   CollectionReference users = FirebaseFirestore.instance.collection('users');
  //   String clientId = t.uid;
  //   try
  //   {
  //     isLoading=true;
  //     notifyListeners();
  //     await users.doc(clientId).set(t.toJson());
  //     await fetchAndSetusers();
  //     user=t;
  //     isLoading=false;
  //     notifyListeners();
  //   } catch (e)
  //   {
  //     log(e.toString());
  //     isError=true;
  //     notifyListeners();
  //     throw Exception(e);
  //   }
  //   notifyListeners();
  //   return;
  // }

  Future<void> addLeague(BuildContext context, var league) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('x-auth-token') ?? '';
      prefs.setString('x-auth-token', token);

      http.Response res = await http.patch(
          Uri.parse('$uri/profile/edit-selectedLeagues?userId=${_user.id}'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
          body: jsonEncode(league));
      log(res.statusCode.toString());
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            setUser(res.body);

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Leagues has been updated'),
              backgroundColor: Colors.green,
            ));
            Navigator.of(context).pushNamedAndRemoveUntil(
                NavBar.routeName, (Route<dynamic> route) => false);
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
