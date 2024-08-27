import 'package:flutter/material.dart';
import 'package:heron/widgets/label/label.dart';
import 'package:heron/models/map/types.dart';
import 'package:heron/widgets/place/header.dart';
import 'package:heron/widgets/place/table.dart';
import 'package:heron/widgets/sheet/handle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showHeronPlaceSheet({
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
                  HeronPlaceSheetHeader(
                    name: name,
                    address: address,
                    placeId: placeId,
                    isFavourite: false,
                    onFavourite: (favourite) {},
                  ),
                  const SizedBox(height: 6.0),
                  HeronPlaceSheetDataTable(
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
