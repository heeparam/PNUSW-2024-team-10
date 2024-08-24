import 'package:flutter/material.dart';
import 'package:heron/screens/profile/settings/appinfo.dart';
import 'package:heron/screens/profile/settings/user.dart';
import 'package:heron/widgets/appbar/appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:heron/widgets/scroll/scroll.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ScrollOffsetProvider(
      builder: (context, scrollOffset, scrollController) => Scaffold(
        appBar: HeronAppBar(
          scrollOffset: scrollOffset,
          title: Text(l10n.settingsTitle),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              HeronUserSettingsList(),
              HeronAppInfoList(),
            ],
          ),
        ),
      ),
    );
  }
}
