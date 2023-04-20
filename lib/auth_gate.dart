import 'package:ball_dont_lie/service/auth_service.dart';
import 'package:ball_dont_lie/wrapper.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget 
{
  AuthGate({super.key});
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _authService.getUserData(context: context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return getHome(snapshot.data!);
        });
  }
}


Widget getHome(int authLevel) {
  switch (authLevel) {
    case 0:
      // return const AutheScreen();
    // break;
    case 1:
      return const Wrapper();
    // break;
    default:
      return const Center(child: Text('Something Went wrong : ((((('));
  }
}
