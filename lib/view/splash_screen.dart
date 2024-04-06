import 'package:flutter/material.dart';
import 'package:flutter_social_media_pegion_post_app/controller/functions_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FunctionProvider>(context);
    provider.checkLoginFunction(context);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 80,
              child: const Image(
                image: AssetImage('assets/2166284-200.png'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: const Text(
                'Post',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
