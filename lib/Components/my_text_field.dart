// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    this.controller,
    this.obscureText = false,
    required this.title,
    required this.validator,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? title;
  final int? maxLines;
  final int? maxLength;
  bool obscureText = false;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
}
