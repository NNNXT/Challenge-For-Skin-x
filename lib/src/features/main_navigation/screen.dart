// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/screen.dart';
import 'package:challenge_for_skin_x/src/features/home/not_logged_in/screen.dart';
import 'package:challenge_for_skin_x/src/features/main_navigation/viewmodel.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) => BaseWidget(
        onModelReady: (model) async {
          await model.getUserToken();
        },
        model: MainNavigationViewModel(context: context),
        builder: (_, model, __) => model.isLoggedIn ? const LoggedInScreen() : const NotLoggedInScreen(),
      );
}
