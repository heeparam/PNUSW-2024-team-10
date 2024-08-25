import 'package:flutter/material.dart';
import 'package:heron/widgets/appbar/appbar.dart';
import 'package:heron/widgets/button/icon.dart';
import 'package:heron/widgets/scroll/scroll.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseDetailsScreen extends StatelessWidget {
  final String? id;

  const CourseDetailsScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ScrollOffsetProvider(
      builder: (context, scrollOffset, scrollController) => Scaffold(
        appBar: HeronAppBar(
          scrollOffset: scrollOffset,
          title: Text(l10n.coursesDetailHeader),
          hideTitleOnTop: true,
          actions: [
            HeronIconButton(
              onPressed: () {},
              icon: Icon(HugeIcons.strokeRoundedFavourite),
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Traditional Busan, Busan’s  Original Downtwon Tour",
                        style: textTheme.titleLarge,
                      ),
                    ],
                  )),
              SizedBox(height: 1557),
            ],
          ),
        ),
      ),
    );
  }
}
