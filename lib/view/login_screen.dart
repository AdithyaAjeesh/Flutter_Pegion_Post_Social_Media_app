import 'package:flutter/material.dart';
import 'package:flutter_social_media_pegion_post_app/controller/functions_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/text_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FunctionProvider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: 440,
          width: 280,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              const SizedBox(height: 40),
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
              ),
              LoginTextFeild(
                hintText: 'Enter PassWord',
                controller: provider.passWordController,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  provider.LoginFunction(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
