// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

PreferredSize AppBarWidgetPref(BuildContext context) {
  return const PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: DefaultTabController(
      length: 10,
      child: AppBarWidget(),
    ),
  );
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 50,
            child: const Image(
              image: AssetImage('assets/2166284-200.png'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const Text(
              'Post',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
