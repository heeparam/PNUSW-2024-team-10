import 'package:go_router/go_router.dart';
import 'package:heron/constants/preferences.dart';
import 'package:heron/screens/courses/details/details.dart';
import 'package:heron/screens/home.dart';
import 'package:heron/screens/profile/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:heron/widgets/restart/restart.dart';
import 'package:heron/widgets/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = SharedPreferences.getInstance()
        .then((prefs) => prefs.getString(kPrefLanguage));

    return FutureBuilder(
      future: languageCode,
      builder: (context, snapshot) => HeronApp(
        routerConfig: _router,
        locale: snapshot.hasData ? Locale(snapshot.data!) : null,
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: "courses/:id",
          builder: (context, state) => CourseDetailsScreen(
            state.pathParameters["id"],
          ),
        ),
        GoRoute(
          path: "profile/settings",
          builder: (context, state) => const SettingsScreen(),
        )
      ],
    ),
  ],
);
