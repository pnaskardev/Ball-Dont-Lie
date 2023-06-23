import 'package:ball_dont_lie/Auth/signup_screen.dart';
import 'package:ball_dont_lie/Auth/widgets/gradient_button.dart';
import 'package:ball_dont_lie/Auth/widgets/login_field.dart';
import 'package:ball_dont_lie/Auth/widgets/social_button.dart';
import 'package:ball_dont_lie/service/auth_service.dart';
import 'package:ball_dont_lie/utils/string_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  static const routeName = '/login';
  final AuthService _authService = AuthService();
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset('assets/images/signin_balls.png'),
                  const Text(
                    'Sign in.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const SocialButton(
                      iconPath: 'assets/svgs/g_logo.svg',
                      label: 'Continue with Google'),
                  const SizedBox(height: 20),
                  const SocialButton(
                    iconPath: 'assets/svgs/f_logo.svg',
                    label: 'Continue with Facebook',
                    horizontalPadding: 90,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'or',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 15),
                  LoginField(hintText: 'Email',controller: _emailController,validator: StringValidator.validateEmail,),
                  const SizedBox(height: 15),
                  LoginField(hintText: 'Password',controller: _passController,),
                  const SizedBox(height: 20),
                  GradientButton(
                      buttontext: 'Sign in',
                      onPressed: () {
                        if(_formKey.currentState!.validate())
                        {
                          _authService.signInUser(
                            context: context,
                            name: _emailController.text.trim(),
                            password: _passController.text.trim());
                        }
                      }),
                  const SizedBox(height: 5),
                  const Text(
                    'or',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 5),
                  GradientButton(
                    buttontext: 'Don\'t have an account ? Sign up',
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, SignupScreen.routeName),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
