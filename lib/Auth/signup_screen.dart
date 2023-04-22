import 'package:ball_dont_lie/Auth/login_screen.dart';
import 'package:ball_dont_lie/Auth/widgets/gradient_button.dart';
import 'package:ball_dont_lie/Auth/widgets/login_field.dart';
import 'package:ball_dont_lie/Auth/widgets/social_button.dart';
import 'package:ball_dont_lie/service/auth_service.dart';
import 'package:ball_dont_lie/utils/string_validator.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/signup';
  SignupScreen({Key? key}) : super(key: key);
  final AuthService _authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  bool? _validatePasswordMatch(String? value) {
    if (value != _passController.text.trim()) {
      return false;
    }
    return true;
  }

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
                    'Sign Up.',
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
                  LoginField(
                    hintText: 'Email',
                    controller: _emailController,
                    validator: StringValidator.validateEmail,
                  ),
                  const SizedBox(height: 15),
                  LoginField(hintText: 'Password', controller: _passController),
                  const SizedBox(height: 20),
                  LoginField(
                      hintText: 'Repeat Password',
                      controller: _confirmPass,
                      validator: _validatePasswordMatch),
                  const SizedBox(height: 20),
                  GradientButton(
                    buttontext: 'Sign Up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _authService.signUpUser(
                            context: context,
                            email: _emailController.text.trim(),
                            password: _passController.text.trim());
                      }
                    },
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'or',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 5),
                  GradientButton(
                    buttontext: 'Already have an account?',
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName),
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
