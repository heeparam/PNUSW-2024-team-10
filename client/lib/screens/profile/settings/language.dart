import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:heron/constants/preferences.dart';
import 'package:heron/widgets/restart/restart.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showLanguageSelectorDialog(BuildContext context) async {
  final currentLocaleString = await SharedPreferences.getInstance()
      .then((prefs) => prefs.getString('language'));

  final initialLocale =
      currentLocaleString != null ? Locale(currentLocaleString) : null;

  if (context.mounted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LanguageSelectorDialog(initialLocale: initialLocale);
      },
    );
  }
}

class LanguageSelectorDialog extends StatefulWidget {
  final Locale? initialLocale;

  const LanguageSelectorDialog({
    super.key,
    this.initialLocale,
  });

  @override
  State<LanguageSelectorDialog> createState() => _LanguageSelectorDialogState();
}

class _LanguageSelectorDialogState extends State<LanguageSelectorDialog> {
  Locale? _selectedLocale;

  void _onLanguageSelected(BuildContext context, Locale? locale) async {
    final prefs = await SharedPreferences.getInstance();

    if (locale == null) {
      prefs.remove(kPrefLanguage);
    } else {
      prefs.setString(kPrefLanguage, locale.languageCode);
    }

    if (context.mounted) {
      RestartWidget.restartApp(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedLocale = widget.initialLocale;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surfaceBright,
      title: Text(l10n.settingsUserLanguage),
      contentPadding: const EdgeInsets.all(10.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<Locale?>(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            title: Text(l10n.settingsUserLanguageSystem),
            value: null,
            groupValue: _selectedLocale,
            onChanged: (Locale? value) {
              setState(() {
                _selectedLocale = value;
              });
            },
          ),
          RadioListTile<Locale>(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            title: Text(l10n.settingsUserLanguageKorean),
            value: const Locale('ko'),
            groupValue: _selectedLocale,
            onChanged: (Locale? value) {
              setState(() {
                _selectedLocale = value;
              });
            },
          ),
          RadioListTile<Locale>(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            title: Text(l10n.settingsUserLanguageEnglish),
            value: const Locale('en'),
            groupValue: _selectedLocale,
            onChanged: (Locale? value) {
              setState(() {
                _selectedLocale = value;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(l10n.commonConfirmationCancel),
        ),
        TextButton(
          onPressed: () {
            _onLanguageSelected(context, _selectedLocale);
            Navigator.pop(context);
          },
          child: Text(l10n.commonConfirmationApply),
        ),
      ],
    );
  }
}
