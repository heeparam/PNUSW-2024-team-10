import 'package:flutter/material.dart';
import 'package:heron/widgets/label/food.dart';
import 'package:heron/models/map/types.dart';
import 'package:heron/widgets/label/spot.dart';
import 'package:heron/widgets/place/base.dart';

void showHeronTourSpotSheet({
  required BuildContext context,
  required String placeId,
  required String name,
  required String address,
  List<HeronTourSpotThemeType> themes = const [],
  required HeronPlaceZoneType zone,
}) {
  showHeronPlaceSheet(
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
  showHeronPlaceSheet(
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