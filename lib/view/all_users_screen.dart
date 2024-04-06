import 'package:flutter/material.dart';
import 'package:flutter_social_media_pegion_post_app/controller/functions_provider.dart';
import 'package:provider/provider.dart';

class AllUserScreen extends StatelessWidget {
  const AllUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FunctionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: provider.fetchAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var user = snapshot.data![index];
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  margin: const EdgeInsets.all(15),
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(user['username'] ?? 'null'),
                      Text(user['email'] ?? 'null'),
                      Text(user['password'] ?? 'null'),
                      Text(user['_id'] ?? 'null'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
