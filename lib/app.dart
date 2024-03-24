// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/navigator_route.dart';
import 'package:challenge_for_skin_x/provider/main_navigation_provider.dart';

// Repository
import 'package:challenge_for_skin_x/network/repository/me_repository.dart';
import 'package:challenge_for_skin_x/network/repository/search_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    List<SingleChildWidget> repositories = [
      Provider.value(value: MeRepository()),
      Provider.value(value: SearchRepository()),
    ];

    List<SingleChildWidget> dependentProviders = [
      ChangeNotifierProxyProvider<MeRepository, MainNavigationProvider>(
        create: (context) => MainNavigationProvider(
          meRepository: context.provide(listen: false),
        ),
        update: (_, repo, previous) => previous ?? MainNavigationProvider(meRepository: repo)
          ..updateRepo(repo),
      ),
    ];
    return MultiProvider(
      providers: [
        ...repositories,
        ...dependentProviders,
      ],
      child: materialApp(context),
    );
  }
}
