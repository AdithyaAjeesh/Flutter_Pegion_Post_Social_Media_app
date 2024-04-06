// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget LoginTextFeild({
  required String hintText,
  required TextEditingController controller,
}) =>
    Container(
      margin: const EdgeInsets.all(15),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    );
