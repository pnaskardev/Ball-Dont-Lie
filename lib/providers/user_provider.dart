import 'dart:developer';

import 'package:ball_dont_lie/models/user.dart' as model;
import 'package:ball_dont_lie/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier
{

  bool isLoading=false;
  bool isError=false;

  static bool didSignOut = false;

  User _user = User
  (
    id: '',
    email: '',
    password: '',
    token: '',
    selectedLeagues: []
  );

  User get user => _user;

  void setUser(String user) 
  {
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

  // void addLeague(String league)
  // {
  //   user!.selectedLeags.add(league);
  //   log(league);
  //   notifyListeners();
  // }

}