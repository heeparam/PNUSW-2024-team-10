import 'package:float_column/float_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heron/widgets/button/icon.dart';
import 'package:heron/widgets/label/food.dart';
import 'package:heron/widgets/label/label.dart';
import 'package:heron/models/map/types.dart';
import 'package:heron/widgets/label/spot.dart';
import 'package:heron/widgets/sheet/handle.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';

void showHeronTourSpotSheet({
  required BuildContext context,
  required String placeId,
  required String name,
  required String address,
  List<HeronTourSpotThemeType> themes = const [],
  required HeronPlaceZoneType zone,
}) {
  _showHeronPlaceSheet(
    context: context,
    placeId: placeId,
    name: name,
    address: address,
    labels: [
      for (final theme in themes) HeronSpotThemeLabel(theme),
    ],
    zone: zone,
  );
}

void showHeronFoodSheet({
  required BuildContext context,
  required String placeId,
  required String name,
  required String address,
  required String menu,
  List<HeronFoodType> labels = const [],
  required HeronPlaceZoneType zone,
}) {
  _showHeronPlaceSheet(
    context: context,
    placeId: placeId,
    name: name,
    address: address,
    menu: menu,
    labels: [
      for (final label in labels) HeronFoodLabel(label),
    ],
    zone: zone,
  );
}

void _showHeronPlaceSheet({
  required BuildContext context,
  required String placeId,
  required String name,
  required String address,
  String? menu,
  List<HeronLabel> labels = const [],
  required HeronPlaceZoneType zone,
}) {
  final colorScheme = Theme.of(context).colorScheme;
  final textTheme = Theme.of(context).textTheme;
  final bottomPadding = MediaQuery.of(context).padding.bottom;
  final imageWidth = MediaQuery.of(context).size.width - 32.0;
  final l10n = AppLocalizations.of(context)!;

  showModalBottomSheet(
    context: context,
    backgroundColor: colorScheme.surfaceBright,
    barrierColor: colorScheme.shadow.withOpacity(0.7),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
    ),
    builder: (context) => Wrap(
      children: [
        Column(
          children: [
            const HeronSheetHandle(),
            Padding(
              padding: EdgeInsets.only(
                top: 4.0,
                bottom: 24.0 + bottomPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeronPlaceSheetHeader(
                    name: name,
                    address: address,
                    placeId: placeId,
                    isFavourite: false,
                    onFavourite: (favourite) {},
                  ),
                  const SizedBox(height: 6.0),
                  _HeronPlaceSheetDataTable(
                    address: address,
                    menu: menu,
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        Text(
                          zone.getDisplayText(l10n),
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.outline,
                          ),
                        ),
                        ...labels,
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Container(
                        color: colorScheme.surfaceDim.withOpacity(0.5),
                        child: Image.network(
                          "https://futuristic-budget-d22.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F92a61ff1-a5fc-4b36-9910-db0f8218224b%2F64ab09e4-2082-4b57-8fde-8f64839791ae%2Fimage.png?table=block&id=55c58bd3-517a-4a9c-be71-1d385d315a61&spaceId=92a61ff1-a5fc-4b36-9910-db0f8218224b&width=2000&userId=&cache=v2",
                          width: imageWidth,
                          height: imageWidth * (10 / 16),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _HeronPlaceSheetHeader extends StatelessWidget {
  final String name;
  final String address;
  final String placeId;
  final bool isFavourite;
  final void Function(bool) onFavourite;

  const _HeronPlaceSheetHeader({
    required this.name,
    required this.address,
    required this.placeId,
    required this.isFavourite,
    required this.onFavourite,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        launchUrlString(
          "https://www.google.com/maps/search/?api=1&query=$address&query_place_id=$placeId",
          mode: LaunchMode.externalApplication,
        );
      },
      child: FloatColumn(
        children: [
          Floatable(
            padding: const EdgeInsets.only(right: 10.0),
            float: FCFloat.right,
            child: HeronIconButton(
              icon: const Icon(HugeIcons.strokeRoundedFavourite),
              onPressed: () {},
            ),
          ),
          WrappableText(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 10.0,
            ),
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$name  ",
                  style: textTheme.titleLarge,
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: colorScheme.primary,
                          width: .33,
                        ),
                      ),
                    ),
                    child: Text(
                      l10n.placeMore,
                      style: textTheme.labelLarge!.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeronPlaceSheetDataTable extends StatelessWidget {
  final String address;
  final String? menu;

  const _HeronPlaceSheetDataTable({
    required this.address,
    this.menu,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: address));
              Fluttertoast.showToast(
                msg: l10n.placeCopiedMessage,
                backgroundColor: colorScheme.inverseSurface,
                textColor: colorScheme.onInverseSurface,
              );
            },
            child: _HeronPlaceSheetDataItem(
              icon: HugeIcons.strokeRoundedLocation01,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "$address  ", style: textTheme.bodyLarge),
                    WidgetSpan(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedCopy01,
                        color: colorScheme.outline,
                        size: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (menu != null) ...[
            const SizedBox(height: 4.0),
            _HeronPlaceSheetDataItem(
              icon: HugeIcons.strokeRoundedMenuRestaurant,
              child: Text(menu!),
            ),
          ],
        ],
      ),
    );
  }
}

class _HeronPlaceSheetDataItem extends StatelessWidget {
  final IconData icon;
  final Widget child;

  const _HeronPlaceSheetDataItem({
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        HugeIcon(icon: icon, color: colorScheme.primary, size: 18.0),
        const SizedBox(width: 8.0),
        DefaultTextStyle(style: textTheme.bodyLarge!, child: child),
      ],
    );
  }
}
