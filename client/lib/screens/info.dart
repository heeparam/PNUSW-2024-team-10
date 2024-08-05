import 'package:flutter/material.dart';
import 'package:heron_app/constants/theme/typography.dart';
import 'package:heron_app/widgets/common/appbar.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = getTypography(context);

    return Scaffold(
        appBar: HeronAppBar(
          child: Text("Info", style: typography.h1),
        ));
  }
}
