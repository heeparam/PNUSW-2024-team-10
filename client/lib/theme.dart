import 'package:client/utilities/ripple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeronApp extends StatelessWidget {
  final Widget? child;

  const HeronApp({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF007AFF),
      dynamicSchemeVariant: DynamicSchemeVariant.content,
    ).copyWith(
      surfaceBright: const Color(0xFFFFFFFF),
      outlineVariant: const Color(0xFF414755).withOpacity(0.16),
    );

    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF007AFF),
      dynamicSchemeVariant: DynamicSchemeVariant.content,
      brightness: Brightness.dark,
    ).copyWith(
      surfaceBright: const Color(0xFF181C23),
      surfaceDim: const Color(0xFF0B0E16),
      outlineVariant: const Color(0xFFC1C6D7).withOpacity(0.07),
    );

    const textTheme = TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        height: 1.25,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
      ),
      headlineMedium: TextStyle(
        fontSize: 26,
        height: 1.25,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        height: 1.25,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        height: 1.25,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        height: 1.25,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        height: 1.25,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.42,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.42,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        height: 1.42,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        height: 1.42,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        height: 1.42,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        height: 1.42,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
    );

    ThemeData themeBuilder(ColorScheme colorScheme) {
      return ThemeData(
        fontFamily: "Pretendard",
        colorScheme: colorScheme,
        useMaterial3: true,
        textTheme: textTheme,
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            splashFactory: HeronRipple.splashFactory,
            shadowColor: WidgetStateProperty.all(Colors.transparent),
            overlayColor: WidgetStateProperty.all(
              colorScheme.onSurface.withOpacity(0.05),
            ),
          ),
        ),
        tabBarTheme: TabBarTheme(
          splashFactory: NoSplash.splashFactory,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          indicatorColor: colorScheme.primaryContainer,
          labelColor: colorScheme.primaryContainer,
          unselectedLabelColor: colorScheme.outline,
          indicator: UnderlineTabIndicator(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
            borderSide: BorderSide(
              color: colorScheme.primaryContainer,
              width: 3,
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: false,
          scrolledUnderElevation: 0,
          titleTextStyle: textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
          // backgroundColor: colorScheme.surfaceContainerLowest,
          // shape: Border(
          //   bottom: BorderSide(
          //       color: colorScheme.surfaceContainerHigh),
          // ),
        ),
      );
    }

    return MaterialApp(
      title: 'Heron',
      themeMode: ThemeMode.system,
      theme: themeBuilder(colorScheme),
      darkTheme: themeBuilder(darkColorScheme),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    );
  }
}
