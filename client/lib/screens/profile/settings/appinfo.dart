import 'package:heron/widgets/list/items.dart';
import 'package:heron/widgets/list/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:package_info_plus/package_info_plus.dart';

const String _repositoryUrl =
    "https://github.com/pnusw-hackathon/PNUSW-2024-team-10";

class HeronAppInfoList extends StatefulWidget {
  const HeronAppInfoList({super.key});

  @override
  State<HeronAppInfoList> createState() => _HeronAppInfoListState();
}

class _HeronAppInfoListState extends State<HeronAppInfoList> {
  PackageInfo packageInfo = PackageInfo(
    appName: '-',
    packageName: '-',
    version: '-',
    buildNumber: '-',
    buildSignature: '-',
    installerStore: '-',
  );

  @override
  void initState() {
    super.initState();

    PackageInfo.fromPlatform().then((value) {
      setState(() {
        packageInfo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return HeronListGroup(
      header: l10n.settingsAppInfoLabel,
      children: [
        HeronListItem(
          child: Row(
            children: [
              Text(l10n.settingsAppInfoVersion),
              const Spacer(),
              Text(packageInfo.version),
            ],
          ),
        ),
        HeronNavigationListItem(
          onPressed: () {

          },
          child: Text(l10n.settingsAppInfoTermsAndPolicy),
        ),
        HeronNavigationListItem(
          onPressed: () {
            showLicensePage(context: context);
          },
          child: Text(l10n.settingsAppInfoLicenses),
        ),
        HeronPressableListItem(
          onPressed: () {
            launchUrlString(
              _repositoryUrl,
              mode: LaunchMode.externalApplication,
            );
          },
          child: Text(
            l10n.settingsAppInfoRepository,
            style: const TextStyle(color: Colors.blueAccent),
          ),
        )
      ],
    );
  }
}
