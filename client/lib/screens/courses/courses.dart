import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.coursesScreenTitle),
          backgroundColor: colorScheme.surfaceBright,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              padding: const EdgeInsets.only(right: 16.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: colorScheme.outlineVariant,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TabBar(
                      padding: EdgeInsets.zero,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(text: l10n.coursesScreenTabAll),
                        Tab(text: l10n.coursesScreenTabLiked),
                        Tab(text: l10n.coursesScreenTabDone),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  IconButton(
                    onPressed: () {},
                    icon: HugeIcon(
                        icon: HugeIcons.strokeRoundedFilterHorizontal,
                        color: colorScheme.outline,
                        size: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Center(
                child: Text("All"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Liked"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Done"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
