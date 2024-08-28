import 'package:flutter/material.dart';
import 'package:heron/screens/map/filter.dart';
import 'package:heron/widgets/chip/chip.dart';
import 'package:hugeicons/hugeicons.dart';

class MapFilterOverlay extends StatelessWidget {
  const MapFilterOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final topMargin = MediaQuery.of(context).padding.top;

    return Positioned(
      top: topMargin + 8.0,
      left: 16.0,
      right: 16.0,
      bottom: 16.0,
      child: Column(
        children: [
          Row(
            children: [
              HeronFilterChip(
                cornerRadius: 8.0,
                icon: HugeIcons.strokeRoundedFilterHorizontal,
                selected: false,
                onSelect: (selected) {
                  showPlacesFilterSheet(
                    context: context,
                    onApply: (themes, foods) {},
                  );
                },
                height: 40.0,
              ),
              const SizedBox(width: 10.0),
              HeronFilterChip(
                cornerRadius: 8.0,
                icon: HugeIcons.strokeRoundedLocation03,
                selected: true,
                onSelect: (selected) {},
                height: 40.0,
                child: const Text("Tour Spot"),
              ),
              const SizedBox(width: 10.0),
              HeronFilterChip(
                cornerRadius: 8.0,
                icon: HugeIcons.strokeRoundedRestaurant02,
                selected: true,
                onSelect: (selected) {},
                height: 40.0,
                child: const Text("Food"),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              HeronFilterChip(
                selected: false,
                iconSize: 24.0,
                onSelect: (selected) {},
                icon: HugeIcons.strokeRoundedFavourite,
                height: 50.0,
                cornerRadius: 8.0,
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
