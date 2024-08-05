import "package:flutter/material.dart";

class HeronFontWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extrabold = FontWeight.w800;
}

HeronTypography getTypography(BuildContext context) {
  final typography = Theme.of(context).extension<HeronTypography>();

  if (typography == null) {
    throw FlutterError(
      "HeronTypography is not found in the current theme. Make sure to add it to the theme extensions.",
    );
  }

  return typography;
}

class HeronTypography extends ThemeExtension<HeronTypography> {
  final Color headingColor;
  final Color bodyColor;

  const HeronTypography(
      {this.headingColor = Colors.black, this.bodyColor = Colors.black});

  TextStyle get h1 => TextStyle(
      fontSize: 32,
      height: 1.3,
      fontWeight: HeronFontWeight.bold,
      color: headingColor);

  TextStyle get h2 => TextStyle(
      fontSize: 26,
      height: 1.3,
      fontWeight: HeronFontWeight.bold,
      color: headingColor);

  TextStyle get h3 => TextStyle(
      fontSize: 20,
      height: 1.3,
      fontWeight: HeronFontWeight.bold,
      color: headingColor);

  TextStyle get h4 => TextStyle(
      fontSize: 18,
      height: 1.3,
      fontWeight: HeronFontWeight.bold,
      color: headingColor);

  TextStyle get body1 =>
      TextStyle(fontSize: 16, height: 1.45, color: bodyColor);

  TextStyle get body2 =>
      TextStyle(fontSize: 14, height: 1.45, color: bodyColor);

  TextStyle get label => TextStyle(fontSize: 12, height: 1.3, color: bodyColor);

  TextStyle get button => TextStyle(
        fontSize: 14,
        height: 1.45,
        color: bodyColor,
      );

  @override
  HeronTypography copyWith() {
    return const HeronTypography();
  }

  @override
  HeronTypography lerp(HeronTypography? other, double t) {
    if (other is! HeronTypography) {
      return this;
    }
    return const HeronTypography();
  }
}

class _HeronTextStyle extends TextStyle {
  const _HeronTextStyle(
      {required double fontSize, required double height, super.fontWeight})
      : super(
          fontSize: fontSize,
          height: height / fontSize,
        );
}
