// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_widget.dart';
import 'package:challenge_for_skin_x/provider/main_navigation_provider.dart';

class MainNavigationViewModel extends ChangeNotifier {
  final MainNavigationProvider _mainNavigationProvider;

  bool get isLoggedIn => _mainNavigationProvider.isLoggedIn;

  Future<void> getUserToken() async {
    await _mainNavigationProvider.getUserToken();
  }

  MainNavigationViewModel({
    required BuildContext context,
  }) : _mainNavigationProvider = context.provide();
}
