// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// Internal Modules
import 'package:challenge_for_skin_x/navigator_route.dart';
import 'package:challenge_for_skin_x/provider/main_navigation_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    List<SingleChildWidget> repositories = [];
    return MultiProvider(
      providers: [
        ...repositories,
        ChangeNotifierProvider<MainNavigationProvider>(
          create: (_) => MainNavigationProvider(),
        ),
      ],
      child: materialApp(context),
    );
  }
}
