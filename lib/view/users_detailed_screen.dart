import 'package:flutter/material.dart';

class UsersDetailed extends StatelessWidget {
  final String userName;
  final String userEmail;
  const UsersDetailed({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black.withOpacity(0.8),
        title: Text(
          '${userName}s Profile',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.8),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                'Name: $userName',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Email: $userEmail',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
