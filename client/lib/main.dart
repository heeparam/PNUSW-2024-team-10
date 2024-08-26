import 'package:go_router/go_router.dart';
import 'package:heron/screens/courses/details/details.dart';
import 'package:heron/screens/home.dart';
import 'package:heron/screens/profile/settings/settings.dart';
import 'package:heron/widgets/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HeronApp(
      routerConfig: _router,
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
