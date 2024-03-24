// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

// Internal Modules
import 'package:challenge_for_skin_x/constant.dart';

// Screen
import 'package:challenge_for_skin_x/src/features/main_navigation/screen.dart';
import 'package:challenge_for_skin_x/src/features/playlist_deatil/screen.dart';

enum NavigatorRoutePath { home, playlistDetail }

extension NavigatorRoutePathExtension on NavigatorRoutePath {
  String get path {
    switch (this) {
      case NavigatorRoutePath.home:
        return '/';

      case NavigatorRoutePath.playlistDetail:
        return 'playlist/detail';

      default:
        return '';
    }
  }

  String get goPath {
    switch (this) {
      case NavigatorRoutePath.playlistDetail:
        return '/playlist/detail';

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
      routes: <RouteBase>[
        GoRoute(
          path: NavigatorRoutePath.playlistDetail.path,
          builder: (_, state) {
            String playlistId = state.extra as String;
            return PlaylistDetailScreen(playlistId: playlistId);
          },
        ),
      ],
    ),
  ],
);

MaterialApp materialApp(BuildContext context) => MaterialApp.router(
      title: 'Challange',
      routerConfig: _router,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primaryTextTheme: Typography().white,
        textTheme: Typography().white,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
