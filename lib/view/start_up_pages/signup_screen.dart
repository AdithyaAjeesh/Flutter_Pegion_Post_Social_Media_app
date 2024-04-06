import 'package:flutter/material.dart';
import 'package:flutter_social_media_pegion_post_app/controller/functions_provider.dart';
import 'package:flutter_social_media_pegion_post_app/view/widgets/text_widgets.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FunctionProvider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: 550,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Sign Up',
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
                hintText: 'Enter Email',
                controller: provider.emailController,
                icon: Icons.email,
              ),
              LoginTextFeild(
                hintText: 'Enter Password',
                controller: provider.passWordController,
                icon: Icons.lock,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  provider.registerUser(
                    context,
                    provider.userNameController.text.trim(),
                    provider.emailController.text.trim(),
                    provider.passWordController.text.trim(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Sign Up',
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
                  provider.goToLoginScreen(context);
                },
                child: const Text(
                  'Login',
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
