// ignore_for_file: library_private_types_in_public_api

import "package:flutter/material.dart";

HeronColors getColors(BuildContext context) {
  final colors = Theme.of(context).extension<HeronColors>();

  if (colors == null) {
    throw FlutterError(
      "HeronColors is not found in the current theme. Make sure to add it to the theme extensions.",
    );
  }

  return colors;
}

class HeronColors extends ThemeExtension<HeronColors> {
  const HeronColors();

  Color get iconGray => const Color(0xFF818181);
  Color get grabber => const Color(0xFFC4C4C7);
  Color get tabGray => const Color(0xFF999999);
  Color get tabBorder => const Color(0x4D000000);
  Color get divider => const Color(0xFFC5C5C6);

  _HeronBackgroundColors get background => const _HeronBackgroundColors();
  _HeronLabelColors get label => const _HeronLabelColors();
  _HeronGlobalColors get global => const _HeronGlobalColors();
  _HeronTextColors get text => const _HeronTextColors();

  @override
  HeronColors copyWith() {
    return const HeronColors();
  }

  @override
  HeronColors lerp(HeronColors? other, double t) {
    if (other is! HeronColors) {
      return this;
    }
    return const HeronColors();
  }
}

class _HeronBackgroundColors {
  const _HeronBackgroundColors();

  Color get modal => const Color(0xFFFAFAFA);
  Color get page => const Color(0xF7F7F7F7);
  Color get dim => const Color(0x33000000);
}

class _HeronLabelColors {
  const _HeronLabelColors();

  Color get gray => const Color(0xFFABABAB);
  Color get blue => const Color(0xFF3A8EDC);
  Color get green => const Color(0xFFA8DC3A);
  Color get red => const Color(0xFFDC3A3A);
  Color get yellow => const Color(0xFFDCA13A);
  Color get violet => const Color(0xFFA83ADC);
}

class _HeronGlobalColors {
  const _HeronGlobalColors();

  Color get white => const Color(0xFFFFFFFF);
  Color get blue => const Color(0xFF007AFF);
}

class _HeronTextColors {
  const _HeronTextColors();

  Color get title => const Color(0xFF272727);
  Color get body => const Color(0xFF3D3D3D);
  Color get gray => const Color(0xFF6C6C6C);
}
