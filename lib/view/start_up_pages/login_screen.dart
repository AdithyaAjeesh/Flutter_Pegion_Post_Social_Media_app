import 'package:flutter/material.dart';
import 'package:flutter_social_media_pegion_post_app/controller/functions_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/text_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FunctionProvider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: 480,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 30),
              LoginTextFeild(
                hintText: 'Enter UserName',
                controller: provider.userNameController,
                icon: Icons.person,
              ),
              LoginTextFeild(
                hintText: 'Enter PassWord',
                controller: provider.passWordController,
                icon: Icons.verified_user,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  provider.LoginFunction(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Or',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 7),
              TextButton(
                onPressed: () {
                  provider.goToSignUpScreen(context);
                },
                child: const Text(
                  'SignUp',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
