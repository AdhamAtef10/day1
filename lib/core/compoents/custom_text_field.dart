import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final hint;
  final prefix;
  final sufixicon;
  final bool obscure;
  final controller;

  CustomTextField({ required this.hint,  required this.prefix,required this.sufixicon, required this.obscure, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hint';
        }
      },
      decoration: InputDecoration(
          prefixIcon: Icon(prefix),
          hintText: hint,
          suffixIcon: sufixicon,
      ),
    );
  }
}

