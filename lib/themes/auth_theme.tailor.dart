// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'auth_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class AuthTheme extends ThemeExtension<AuthTheme> {
  const AuthTheme({
    required this.authBackgroundColor,
    required this.forgetPasswordTextStyle,
    required this.lableTextStyle,
    required this.loginButtonStyle,
    required this.loginButtonTextStyle,
    required this.logoBackgoundColor,
    required this.titleTextStyle,
  });

  final Color authBackgroundColor;
  final TextStyle forgetPasswordTextStyle;
  final TextStyle lableTextStyle;
  final ButtonStyle loginButtonStyle;
  final TextStyle loginButtonTextStyle;
  final Color logoBackgoundColor;
  final TextStyle titleTextStyle;

  static const AuthTheme light = AuthTheme(
    authBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
    forgetPasswordTextStyle: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(67, 67, 244, 1),
        fontSize: 18),
    lableTextStyle: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(37, 37, 37, 1),
        fontSize: 28),
    loginButtonStyle: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(37, 37, 37, 1)),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)))),
      overlayColor:
          MaterialStatePropertyAll(Color.fromRGBO(255, 255, 255, 0.2)),
    ),
    loginButtonTextStyle: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontSize: 24),
    logoBackgoundColor: Color.fromRGBO(37, 37, 37, 1),
    titleTextStyle: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(37, 37, 37, 1),
        fontSize: 22),
  );

  static const AuthTheme dark = AuthTheme(
    authBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
    forgetPasswordTextStyle: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(67, 67, 244, 1),
        fontSize: 18),
    lableTextStyle: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(37, 37, 37, 1),
        fontSize: 28),
    loginButtonStyle: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(37, 37, 37, 1)),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)))),
      overlayColor:
          MaterialStatePropertyAll(Color.fromRGBO(255, 255, 255, 0.2)),
    ),
    loginButtonTextStyle: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(255, 255, 255, 1),
        fontSize: 24),
    logoBackgoundColor: Color.fromRGBO(37, 37, 37, 1),
    titleTextStyle: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(37, 37, 37, 1),
        fontSize: 22),
  );

  static const themes = [
    light,
    dark,
  ];

  @override
  AuthTheme copyWith({
    Color? authBackgroundColor,
    TextStyle? forgetPasswordTextStyle,
    TextStyle? lableTextStyle,
    ButtonStyle? loginButtonStyle,
    TextStyle? loginButtonTextStyle,
    Color? logoBackgoundColor,
    TextStyle? titleTextStyle,
  }) {
    return AuthTheme(
      authBackgroundColor: authBackgroundColor ?? this.authBackgroundColor,
      forgetPasswordTextStyle:
          forgetPasswordTextStyle ?? this.forgetPasswordTextStyle,
      lableTextStyle: lableTextStyle ?? this.lableTextStyle,
      loginButtonStyle: loginButtonStyle ?? this.loginButtonStyle,
      loginButtonTextStyle: loginButtonTextStyle ?? this.loginButtonTextStyle,
      logoBackgoundColor: logoBackgoundColor ?? this.logoBackgoundColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  AuthTheme lerp(covariant ThemeExtension<AuthTheme>? other, double t) {
    if (other is! AuthTheme) return this as AuthTheme;
    return AuthTheme(
      authBackgroundColor:
          Color.lerp(authBackgroundColor, other.authBackgroundColor, t)!,
      forgetPasswordTextStyle: TextStyle.lerp(
          forgetPasswordTextStyle, other.forgetPasswordTextStyle, t)!,
      lableTextStyle: TextStyle.lerp(lableTextStyle, other.lableTextStyle, t)!,
      loginButtonStyle: t < 0.5 ? loginButtonStyle : other.loginButtonStyle,
      loginButtonTextStyle:
          TextStyle.lerp(loginButtonTextStyle, other.loginButtonTextStyle, t)!,
      logoBackgoundColor:
          Color.lerp(logoBackgoundColor, other.logoBackgoundColor, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthTheme &&
            const DeepCollectionEquality()
                .equals(authBackgroundColor, other.authBackgroundColor) &&
            const DeepCollectionEquality().equals(
                forgetPasswordTextStyle, other.forgetPasswordTextStyle) &&
            const DeepCollectionEquality()
                .equals(lableTextStyle, other.lableTextStyle) &&
            const DeepCollectionEquality()
                .equals(loginButtonStyle, other.loginButtonStyle) &&
            const DeepCollectionEquality()
                .equals(loginButtonTextStyle, other.loginButtonTextStyle) &&
            const DeepCollectionEquality()
                .equals(logoBackgoundColor, other.logoBackgoundColor) &&
            const DeepCollectionEquality()
                .equals(titleTextStyle, other.titleTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(authBackgroundColor),
      const DeepCollectionEquality().hash(forgetPasswordTextStyle),
      const DeepCollectionEquality().hash(lableTextStyle),
      const DeepCollectionEquality().hash(loginButtonStyle),
      const DeepCollectionEquality().hash(loginButtonTextStyle),
      const DeepCollectionEquality().hash(logoBackgoundColor),
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}
