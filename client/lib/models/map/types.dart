import 'package:heron/widgets/theme/label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum HeronPlaceZoneType {
  haeundae,
  downtown,
  gijang;

  String getDisplayText(AppLocalizations l10n) {
    switch (this) {
      case HeronPlaceZoneType.haeundae:
        return l10n.placeZoneHaeundae;
      case HeronPlaceZoneType.downtown:
        return l10n.placeZoneDowntown;
      case HeronPlaceZoneType.gijang:
        return l10n.placeZoneGijang;
    }
  }
}

enum HeronFoodType {
  vegan(HeronLabelColorType.green),
  blueribbon(HeronLabelColorType.blue),
  halal(HeronLabelColorType.yellow),
  michelin(HeronLabelColorType.red),
  single(HeronLabelColorType.purple);

  const HeronFoodType(this.color);
  final HeronLabelColorType color;

  String getDisplayText(AppLocalizations l10n) {
    switch (this) {
      case HeronFoodType.vegan:
        return l10n.foodVegan;
      case HeronFoodType.blueribbon:
        return l10n.foodBlueRibbon;
      case HeronFoodType.halal:
        return l10n.foodHalal;
      case HeronFoodType.michelin:
        return l10n.foodMichelin;
      case HeronFoodType.single:
        return l10n.foodSingle;
    }
  }
}

enum HeronTourSpotThemeType {
  history(HeronLabelColorType.yellow),
  nature(HeronLabelColorType.green),
  culture(HeronLabelColorType.blue),
  shopping(HeronLabelColorType.red);

  const HeronTourSpotThemeType(this.color);
  final HeronLabelColorType color;

  String getDisplayText(AppLocalizations l10n) {
    switch (this) {
      case HeronTourSpotThemeType.history:
        return l10n.tourSpotThemeHistory;
      case HeronTourSpotThemeType.nature:
        return l10n.tourSpotThemeNature;
      case HeronTourSpotThemeType.culture:
        return l10n.tourSpotThemeCulture;
      case HeronTourSpotThemeType.shopping:
        return l10n.tourSpotThemeShopping;
    }
  }
}