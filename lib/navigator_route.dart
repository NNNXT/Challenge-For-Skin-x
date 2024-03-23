// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

// Screen
import 'package:challenge_for_skin_x/constant.dart';
import 'package:challenge_for_skin_x/src/features/main_navigation/screen.dart';

enum NavigatorRoutePath { home }

extension NavigatorRoutePathExtension on NavigatorRoutePath {
  String get path {
    switch (this) {
      case NavigatorRoutePath.home:
        return '/';

      default:
        return '';
    }
  }
}

GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: NavigatorRoutePath.home.path,
      builder: (_, __) => const MainNavigationScreen(),
      routes: const <RouteBase>[],
    ),
  ],
);

MaterialApp materialApp(BuildContext context) => MaterialApp.router(
      title: 'Challange',
      routerConfig: _router,
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        primaryTextTheme: Typography().white,
        textTheme: Typography().white,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
