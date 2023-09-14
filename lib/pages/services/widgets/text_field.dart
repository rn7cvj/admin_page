import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.validator, required this.controller, required this.obscureText, this.labelText});

  final String? Function(String? value) validator;

  final TextEditingController controller;
  final bool obscureText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.all(8.0),
        fillColor: const Color.fromRGBO(67, 67, 244, 1),
        focusColor: const Color.fromRGBO(67, 67, 244, 1),
        hoverColor: const Color.fromRGBO(67, 67, 244, 1),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}
