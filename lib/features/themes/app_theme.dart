import 'package:admin_page/features/themes/navigation_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_theme.tailor.dart';

@Tailor(
  themes: ['light', 'dark'],
  themeGetter: ThemeGetter.onBuildContext,
  generateStaticGetters: true,
)
class _$AppTheme {
  @themeExtension
  static List<NavigationTheme> navigationTheme = [
    NavigationTheme.light,
    NavigationTheme.dark,
  ];

  static const List<Color> backgoundColor = [
    Color.fromRGBO(247, 247, 247, 1),
    Color.fromRGBO(247, 247, 247, 1),
  ];

  static const List<Color> buttonColor = [
    Color.fromRGBO(67, 67, 244, 1),
    Color.fromRGBO(67, 67, 244, 1),
  ];

  static const List<Color> buttonIconColor = [
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(255, 255, 255, 1),
  ];

  static const List<TextStyle> buttonextStyle = [
    TextStyle(fontFamily: "Roboto", fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w300),
    TextStyle(fontFamily: "Roboto", fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w300),
  ];

  static const List<Color> cardColor = [
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(255, 255, 255, 1),
  ];

  static const List<TextStyle> lableTextStyle = [
    TextStyle(fontFamily: "Roboto", fontSize: 32, color: Color.fromRGBO(37, 37, 37, 1), fontWeight: FontWeight.w600),
    TextStyle(fontFamily: "Roboto", fontSize: 32, color: Color.fromRGBO(37, 37, 37, 1), fontWeight: FontWeight.w600),
  ];

  // Цвета из стилей текста не применяются

  static const List<Color> indicatorTabColor = [
    const Color.fromRGBO(67, 67, 244, 1),
    const Color.fromRGBO(67, 67, 244, 1)
  ];

  static const List<Color> secetedTabColor = [
    Color.fromRGBO(37, 37, 37, 1),
    Color.fromRGBO(37, 37, 37, 1),
  ];

  static const List<Color> unsecetedTabColor = [
    Color.fromRGBO(193, 193, 193, 1),
    Color.fromRGBO(193, 193, 193, 1),
  ];

  static const List<TextStyle> selectedTabTextStyle = [
    TextStyle(fontFamily: "Roboto", fontSize: 28, fontWeight: FontWeight.w600),
    TextStyle(fontFamily: "Roboto", fontSize: 28, fontWeight: FontWeight.w600),
  ];

  static const List<TextStyle> unselectedTabTextStyle = [
    TextStyle(fontFamily: "Roboto", fontSize: 28, fontWeight: FontWeight.w300),
    TextStyle(fontFamily: "Roboto", fontSize: 28, fontWeight: FontWeight.w300),
  ];

  static const List<TextStyle> cardHeadlineTextStyle = [
    TextStyle(fontFamily: "Roboto", fontSize: 28, color: Color.fromRGBO(37, 37, 37, 1), fontWeight: FontWeight.w500),
    TextStyle(fontFamily: "Roboto", fontSize: 28, color: Color.fromRGBO(37, 37, 37, 1), fontWeight: FontWeight.w500),
  ];

  static const List<TextStyle> cardContentTextStyle = [
    TextStyle(fontFamily: "Roboto", fontSize: 16, color: Color.fromRGBO(37, 37, 37, 1), fontWeight: FontWeight.w300),
    TextStyle(fontFamily: "Roboto", fontSize: 16, color: Color.fromRGBO(37, 37, 37, 1), fontWeight: FontWeight.w300),
  ];

  static const List<TextStyle> tabelHeadlineTextStyle = [
    TextStyle(fontFamily: "Roboto", fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.w400),
    TextStyle(fontFamily: "Roboto", fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.w400),
  ];

  static const List<TextStyle> tabelContentTextStyle = [
    TextStyle(fontFamily: "Roboto", fontSize: 18, color: Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.w300),
    TextStyle(fontFamily: "Roboto", fontSize: 18, color: Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.w300),
  ];
}
