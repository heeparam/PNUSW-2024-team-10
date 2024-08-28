import 'package:flutter/material.dart';
import 'package:heron/models/map/types.dart';
import 'package:heron/widgets/chip/chip.dart';
import 'package:heron/widgets/filter/filter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showCoursesFilterSheet({
  required BuildContext context,
  required void Function(
    List<HeronPlaceZoneType> zones,
    List<HeronTourSpotThemeType> themes,
  ) onApply,
}) {
  final GlobalKey<_FilterSheetBodyState> filterSheetBodyKey =
      GlobalKey<_FilterSheetBodyState>();

  showFilterSheet(
    context: context,
    onApply: () {
      onApply(
        filterSheetBodyKey.currentState!.selectedZones,
        filterSheetBodyKey.currentState!.selectedThemes,
      );
    },
    child: FilterSheetBody(
      key: filterSheetBodyKey,
    ),
    onReset: () {
      filterSheetBodyKey.currentState!.reset();
    },
  );
}

class FilterSheetBody extends StatefulWidget {
  const FilterSheetBody({super.key});

  @override
  State<FilterSheetBody> createState() => _FilterSheetBodyState();
}

class _FilterSheetBodyState extends State<FilterSheetBody> {
  List<HeronPlaceZoneType> selectedZones = HeronPlaceZoneType.values;
  List<HeronTourSpotThemeType> selectedThemes = HeronTourSpotThemeType.values;

  void reset() {
    setState(() {
      selectedZones = HeronPlaceZoneType.values;
      selectedThemes = HeronTourSpotThemeType.values;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        HeronFilterSelector(
          title: "Zone",
          items: HeronPlaceZoneType.values,
          onSelectAll: () {
            setState(() {
              selectedZones = List.from(HeronPlaceZoneType.values);
            });
          },
          onDeselectAll: () {
            setState(() {
              selectedZones = [];
            });
          },
          builder: (i, zone) => HeronFilterChip(
            icon: zone.icon,
            selected: selectedZones.contains(zone),
            child: Text(zone.getDisplayText(l10n)),
            onSelect: (selected) {
              setState(() {
                if (selected) {
                  selectedZones.add(zone);
                } else {
                  selectedZones.remove(zone);
                }
              });
            },
          ),
        ),
        const SizedBox(height: 24.0),
        HeronFilterSelector(
          title: "Theme",
          items: HeronTourSpotThemeType.values,
          onSelectAll: () {
            setState(() {
              selectedThemes = List.from(HeronTourSpotThemeType.values);
            });
          },
          onDeselectAll: () {
            setState(() {
              selectedThemes = [];
            });
          },
          builder: (i, theme) => HeronFilterChip(
            icon: theme.icon,
            selected: selectedThemes.contains(theme),
            child: Text(theme.getDisplayText(l10n)),
            onSelect: (selected) {
              setState(() {
                if (selected) {
                  selectedThemes.add(theme);
                } else {
                  selectedThemes.remove(theme);
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
