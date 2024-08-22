import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Courses"),
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
                  const Expanded(
                    child: TabBar(
                      padding: EdgeInsets.zero,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(text: "All"),
                        Tab(text: "Liked"),
                        Tab(text: "Done"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    onPressed: () {},
                    icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedFilterHorizontal,
                      color: colorScheme.outline,
                    ),
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
