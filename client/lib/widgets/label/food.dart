import 'package:flutter/material.dart';
import 'package:heron/widgets/label/label.dart';
import 'package:heron/models/map/types.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeronFoodLabel extends HeronLabel {
  final HeronFoodType type;

  const HeronFoodLabel(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return HeronLabel(
      color: type.color,
      child: Text(type.getDisplayText(l10n).toUpperCase()),
    );
  }
}
