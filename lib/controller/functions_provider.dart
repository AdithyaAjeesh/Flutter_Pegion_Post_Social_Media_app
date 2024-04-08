// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_social_media_pegion_post_app/view/home_screen.dart';
import 'package:flutter_social_media_pegion_post_app/view/start_up_pages/login_screen.dart';
import 'package:flutter_social_media_pegion_post_app/view/start_up_pages/signup_screen.dart';
import 'package:flutter_social_media_pegion_post_app/view/start_up_pages/splash_screen.dart';
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

  Future<void> registerUser(
    BuildContext context,
    String username,
    String email,
    String password,
  ) async {
    print('REGISTERING USER');
    String url = 'https://socialmedia-api-v1.onrender.com/auth/register';
    Map<String, dynamic> userData = {
      'username': userNameController.text,
      'email': emailController.text,
      'password': passWordController.text,
    };
    String jsonBody = json.encode(userData);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonBody,
      );
      if (response.statusCode == 200) {
        print('User registration successful');
      } else {
        print('Failed to register user');
      }
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchAllUsers() async {
    final response = await http.get(
      Uri.parse('https://socialmedia-api-v1.onrender.com/user/'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> users = List<Map<String, dynamic>>.from(data);
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
