import 'package:heron/screens/map/filter.dart';
import 'package:heron/screens/map/googlemap.dart';
import 'package:flutter/material.dart';
import 'package:heron/screens/map/overlay.dart';
import 'package:heron/widgets/appbar/status.dart';
import 'package:heron/widgets/button/button.dart';
import 'package:heron/widgets/chip/chip.dart';
import 'package:hugeicons/hugeicons.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topMargin = MediaQuery.of(context).padding.top;
    final colorScheme = Theme.of(context).colorScheme;

    return StatusBarColor(
      child: Stack(
        children: [
          HeronGoogleMap(),
          MapFilterOverlay(),
        ],
      ),
    );
  }
}
