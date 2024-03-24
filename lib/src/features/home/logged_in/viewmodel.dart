// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/constant.dart';
import 'package:challenge_for_skin_x/provider/main_navigation_provider.dart';

class LoggedInViewModel extends ChangeNotifier {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final MainNavigationProvider _mainNavigationProvider;

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> getUserToken() async {
    await _mainNavigationProvider.getUserToken();
  }

  Future<void> logout() async {
    await _secureStorage.delete(
      key: accesTokenKey,
    );
    await _secureStorage.delete(
      key: refreshTokenKey,
    );
    _mainNavigationProvider.getUserToken();
  }

  LoggedInViewModel({
    required BuildContext context,
  }) : _mainNavigationProvider = context.provide();
}
