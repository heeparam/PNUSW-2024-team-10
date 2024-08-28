import 'package:flutter/material.dart';
import 'package:heron/widgets/button/button.dart';
import 'package:heron/widgets/button/text.dart';
import 'package:heron/widgets/chip/chip.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:heron/widgets/sheet/handle.dart';
import 'package:snapping_bottom_sheet/snapping_bottom_sheet.dart';

void showFilterSheet(
    {required BuildContext context,
    required void Function() onApply,
    required Widget child,
    void Function()? onReset}) {
  final colorScheme = Theme.of(context).colorScheme;
  final l10n = AppLocalizations.of(context)!;

  final deviceHeight = MediaQuery.of(context).size.height;
  final devicePadding = MediaQueryData.fromView(View.of(context)).padding;

  final maxSheetHeight =
      (deviceHeight - devicePadding.top - 16.0) / deviceHeight;

  showSnappingBottomSheet(
    context,
    builder: (context) => SnappingBottomSheetDialog(
      cornerRadius: 10.0,
      duration: const Duration(milliseconds: 300),
      snapSpec: SnapSpec(
        snap: true,
        initialSnap: 0.5,
        snappings: [0.5, maxSheetHeight],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      scrollSpec: const ScrollSpec(
        overscroll: true,
      ),
      headerBuilder: (context, sheetState) => Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: colorScheme.surfaceBright,
          // border: Border(
          //   bottom: BorderSide(
          //     color: colorScheme.outlineVariant,
          //     width: 1.0,
          //   ),
          // ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      const SizedBox(width: 10.0),
                      Text(
                        l10n.filterTitle,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Spacer(),
                      HeronTextButton(
                        onPressed: onReset,
                        child: Text(
                          l10n.filterReset,
                          style: TextStyle(color: colorScheme.outline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: HeronSheetHandle(),
            ),
          ],
        ),
      ),
      footerBuilder: (context, sheetState) => Container(
        color: colorScheme.surfaceBright,
        height: 80 + devicePadding.bottom,
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: devicePadding.bottom,
        ),
        alignment: Alignment.center,
        child: HeronButton(
          onPressed: () {
            onApply();
            Navigator.of(context).pop();
          },
          child: Text(l10n.filterApply),
        ),
      ),
      builder: (contxt, sheetState) => Container(
        color: colorScheme.surfaceBright,
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Material(
          color: Colors.transparent,
          child: child,
        ),
      ),
    ),
  );
}

class HeronFilterSelector<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final HeronFilterChip Function(int, T) builder;

  final void Function()? onSelectAll;
  final void Function()? onDeselectAll;

  const HeronFilterSelector({
    super.key,
    required this.title,
    required this.items,
    required this.builder,
    this.onSelectAll,
    this.onDeselectAll,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    final chipItems = [
      for (var i = 0; i < items.length; i++) builder(i, items[i]),
    ];

    final isAllSelected = chipItems.every((item) => item.selected);
    final selectAllText =
        isAllSelected ? l10n.filterUnselectAll : l10n.filterSelectAll;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 14.0),
          child: Row(
            children: [
              Text(title, style: textTheme.labelLarge),
              const Spacer(),
              if (onSelectAll != null && onDeselectAll != null)
                HeronTextButton(
                  color: colorScheme.primary,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 4.0),
                  child: Text(selectAllText),
                  onPressed: () {
                    if (isAllSelected) {
                      onDeselectAll!();
                    } else {
                      onSelectAll!();
                    }
                  },
                ),
            ],
          ),
        ),
        const SizedBox(height: 6.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: chipItems,
          ),
        ),
      ],
    );
  }
}
