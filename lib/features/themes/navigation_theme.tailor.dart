// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'navigation_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class NavigationTheme extends ThemeExtension<NavigationTheme> {
  const NavigationTheme({
    required this.backgoundColor,
    required this.iconColor,
    required this.indicatorColor,
  });

  final Color backgoundColor;
  final Color iconColor;
  final Color indicatorColor;

  static final NavigationTheme light = NavigationTheme(
    backgoundColor: _$NavigationTheme.backgoundColor[0],
    iconColor: _$NavigationTheme.iconColor[0],
    indicatorColor: _$NavigationTheme.indicatorColor[0],
  );

  static final NavigationTheme dark = NavigationTheme(
    backgoundColor: _$NavigationTheme.backgoundColor[1],
    iconColor: _$NavigationTheme.iconColor[1],
    indicatorColor: _$NavigationTheme.indicatorColor[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  NavigationTheme copyWith({
    Color? backgoundColor,
    Color? iconColor,
    Color? indicatorColor,
  }) {
    return NavigationTheme(
      backgoundColor: backgoundColor ?? this.backgoundColor,
      iconColor: iconColor ?? this.iconColor,
      indicatorColor: indicatorColor ?? this.indicatorColor,
    );
  }

  @override
  NavigationTheme lerp(
      covariant ThemeExtension<NavigationTheme>? other, double t) {
    if (other is! NavigationTheme) return this as NavigationTheme;
    return NavigationTheme(
      backgoundColor: Color.lerp(backgoundColor, other.backgoundColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      indicatorColor: Color.lerp(indicatorColor, other.indicatorColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationTheme &&
            const DeepCollectionEquality()
                .equals(backgoundColor, other.backgoundColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality()
                .equals(indicatorColor, other.indicatorColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgoundColor),
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(indicatorColor),
    );
  }
}
