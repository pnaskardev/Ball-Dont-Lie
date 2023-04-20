// ignore_for_file: empty_catches, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:ball_dont_lie/models/user.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:ball_dont_lie/utils/error-handle.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:ball_dont_lie/utils/utils.dart';
import 'package:ball_dont_lie/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<int> getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('x-auth-token') ?? '';
      prefs.setString('x-auth-token', token);
      log(token);
      var tokenRes = await http.post(Uri.parse('$uri/auth/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          });
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        // GET THE USER DATA
        http.Response userResponse = await http
            .get(Uri.parse('$uri/auth/getUserData'), headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        });
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userResponse.body);
        return 1;
      }
    } catch (e) {
      showSnackBar(context, '${e.toString}', false);
    }
    return 0;
  }

  // sign up user
  Future signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User
      (
        id: '',
        name: name,
        email: email,
        password: password,
        token: '',
        selectedLeagues: []
      );
      http.Response res = await http.post(Uri.parse('$uri/auth/signup'),
          // body: user.toJson(),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
            // 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, 'Account created!!',true);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            Navigator.pushNamedAndRemoveUntil(
                context, Wrapper.routeName, (route) => false);
          });
    } catch (e) {
      log('$uri/auth/signup');
      log(e.toString());
      showSnackBar(context, '${e.toString}',false);
    }
  }

  void signInUser({
    required BuildContext context,
    required String name,
    required String password,
  }) async {
    log('sign in user');
    try {
      http.Response res = await http.post(Uri.parse('$uri/auth/signin'),
          // body: user.toJson(),
          body: json.encode({'name': name, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      // print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            Navigator.pushNamedAndRemoveUntil(
                context, Wrapper.routeName, (route) => false);
          });
    } catch (e) {
      log('$uri/auth/signup');
      log(e.toString());
      showSnackBar(context, '${e.toString}',false);
    }
  }
}
