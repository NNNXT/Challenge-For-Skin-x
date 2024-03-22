// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:dio/dio.dart';

// Internal Modules
import 'package:challenge_for_skin_x/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainNavigationProvider extends ChangeNotifier {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  bool _userIsLogin = false;
  String _userImage = '';
  String _displayName = '';

  bool get userIsLogin => _userIsLogin;
  String get userImage => _userImage;
  String get displayName => _displayName;

  Future<void> getUserToken() async {
    String userToken = await _secureStorage.read(key: accesTokenKey) ?? '';

    _userIsLogin = userToken.isNotEmpty;

    if (userIsLogin) {
      var response = await Dio().get(
        'https://api.spotify.com/v1/me',
        options: Options(
          headers: {'Authorization': 'Bearer $userToken'},
        ),
      );

      _userImage = response.data['images'][1]['url'];
      _displayName = response.data['display_name'];
    }
    notifyListeners();
  }
}
