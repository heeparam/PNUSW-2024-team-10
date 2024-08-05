import 'package:flutter/material.dart';
import 'package:heron_app/constants/theme/typography.dart';
import 'package:heron_app/widgets/common/appbar.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = getTypography(context);

    return Scaffold(
        appBar: HeronAppBar(
          child: Text("Course", style: typography.h1),
        ));
  }
}
