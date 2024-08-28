import 'package:flutter/material.dart';
import 'package:heron/widgets/button/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return HeronButton(
      variant: HeronButtonVariant.outline,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: Text("", style: TextStyle(fontSize: 21.0)),
          ),
          const SizedBox(width: 8.0),
          Text(l10n.signInWithApple),
        ],
      ),
    );
  }
}
