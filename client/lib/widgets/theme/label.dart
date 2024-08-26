import 'package:flutter/material.dart';

enum HeronLabelColorType {
  gray,
  red,
  green,
  blue,
  yellow,
  purple,
}

HeronLabelColors getHeronLabelColors(BuildContext context) {
  final labelColors = Theme.of(context).extension<HeronLabelColors>();
  if (labelColors == null) {
    throw FlutterError('HeronLabelColors is not found in the current theme');
  }

  return labelColors;
}

class HeronLabelColors extends ThemeExtension<HeronLabelColors> {
  final Color gray;
  final Color red;
  final Color green;
  final Color blue;
  final Color yellow;
  final Color purple;

  const HeronLabelColors({
    required this.gray,
    required this.red,
    required this.green,
    required this.blue,
    required this.yellow,
    required this.purple,
  });

  @override
  HeronLabelColors copyWith({
    Color? gray,
    Color? red,
    Color? green,
    Color? blue,
    Color? yellow,
    Color? purple,
  }) {
    return HeronLabelColors(
      gray: gray ?? this.gray,
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      yellow: yellow ?? this.yellow,
      purple: purple ?? this.purple,
    );
  }

  @override
  HeronLabelColors lerp(HeronLabelColors? other, double t) {
    if (other is! HeronLabelColors) {
      return this;
    }

    return HeronLabelColors(
      gray: Color.lerp(gray, other.gray, t)!,
      red: Color.lerp(red, other.red, t)!,
      green: Color.lerp(green, other.green, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
    );
  }

  Color getColor(HeronLabelColorType type) {
    switch (type) {
      case HeronLabelColorType.gray:
        return gray;
      case HeronLabelColorType.red:
        return red;
      case HeronLabelColorType.green:
        return green;
      case HeronLabelColorType.blue:
        return blue;
      case HeronLabelColorType.yellow:
        return yellow;
      case HeronLabelColorType.purple:
        return purple;
    }
  }
}
