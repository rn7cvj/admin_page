import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.validator});

  String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        fillColor: Color.fromRGBO(67, 67, 244, 1),
        focusColor: Color.fromRGBO(67, 67, 244, 1),
        hoverColor: Color.fromRGBO(67, 67, 244, 1),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}
