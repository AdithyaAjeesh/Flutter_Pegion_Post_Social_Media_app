// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_social_media_pegion_post_app/view/home_screen.dart';
import 'package:flutter_social_media_pegion_post_app/view/login_screen.dart';
import 'package:flutter_social_media_pegion_post_app/view/signup_screen.dart';
import 'package:flutter_social_media_pegion_post_app/view/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FunctionProvider extends ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> LoginFunction(context) async {
    String userName = userNameController.text.trim();
    String passWord = passWordController.text.trim();
    if (userName == '123' && passWord == '123') {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('key', true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
      userNameController.clear();
      passWordController.clear();
    }
  }

  Future<void> checkLoginFunction(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isLoggedIn = preferences.getBool('key') ?? false;
    if (isLoggedIn == true) {
      Timer(const Duration(seconds: 2), () {
        // print('HomeScreen');
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    } else if (isLoggedIn == false) {
      Timer(const Duration(seconds: 2), () {
        // print('LoginScreen');
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  Future<void> logoutFunction(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('key', false);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SplashScreen()));
  }

  void goToSignUpScreen(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  void goToLoginScreen(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
