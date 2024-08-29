import 'package:heron/screens/info/webview.dart';
import 'package:flutter/material.dart';
import 'package:heron/widgets/appbar/appbar.dart';
import 'package:heron/widgets/button/icon.dart';
import 'package:hugeicons/hugeicons.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  double scrollOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeronAppBar(
        hasBackButton: false,
        scrollOffset: scrollOffset,
        largeTitle: true,
        title: const Text('Info'),
        actions: [
          HeronIconButton(
            onPressed: () {},
            icon: const Icon(HugeIcons.strokeRoundedFilterHorizontal),
          ),
        ],
      ),
      body: InfoWebView(
        onScroll: (offset) {
          setState(() {
            scrollOffset = offset;
          });
        },
      ),
    );
  }
}
