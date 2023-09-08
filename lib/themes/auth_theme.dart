// ignore_for_file: unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'auth_theme.tailor.dart';

@tailorComponent
class _$AuthTheme {
  static const List<Color> logoBackgoundColor = [
    Color.fromRGBO(37, 37, 37, 1),
    Color.fromRGBO(37, 37, 37, 1),
  ];

  static const List<Color> authBackgroundColor = [
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(255, 255, 255, 1),
  ];

  static const List<TextStyle> lableTextStyle = [
    TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w600, color: Color.fromRGBO(37, 37, 37, 1), fontSize: 28),
    TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w600, color: Color.fromRGBO(37, 37, 37, 1), fontSize: 28),
  ];

  static const List<TextStyle> titleTextStyle = [
    TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w400, color: Color.fromRGBO(37, 37, 37, 1), fontSize: 22),
    TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w400, color: Color.fromRGBO(37, 37, 37, 1), fontSize: 22),
  ];

  static const List<TextStyle> forgetPasswordTextStyle = [
    TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w400, color: Color.fromRGBO(67, 67, 244, 1), fontSize: 18),
    TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w400, color: Color.fromRGBO(67, 67, 244, 1), fontSize: 18),
  ];

  static const List<ButtonStyle> loginButtonStyle = [
    ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(37, 37, 37, 1)),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
      overlayColor: MaterialStatePropertyAll(Color.fromRGBO(255, 255, 255, 0.2)),
    ),
    ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(37, 37, 37, 1)),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
      overlayColor: MaterialStatePropertyAll(Color.fromRGBO(255, 255, 255, 0.2)),
    ),
  ];

  static const List<TextStyle> loginButtonTextStyle = [
    TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w400, color: Color.fromRGBO(255, 255, 255, 1), fontSize: 24),
    TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w400, color: Color.fromRGBO(255, 255, 255, 1), fontSize: 24),
  ];
}
