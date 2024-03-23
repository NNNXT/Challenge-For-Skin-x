// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Internal Modules
import 'package:challenge_for_skin_x/constant.dart';
import 'package:challenge_for_skin_x/network/repository/me_repository.dart';

class MainNavigationProvider extends ChangeNotifier {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  MeRepository _meRepository;

  bool _isLoggedIn = false;
  String _userImage = '';
  String _displayName = '';

  bool get isLoggedIn => _isLoggedIn;
  String get userImage => _userImage;
  String get displayName => _displayName;

  Future<void> getUserToken() async {
    String userToken = await _secureStorage.read(key: accesTokenKey) ?? '';

    _isLoggedIn = userToken.isNotEmpty;

    if (_isLoggedIn) {
      var response = await _meRepository.requestCurrentUserProfile();
      _displayName = response.result?.displayName ?? '';
      _userImage = response.result?.images?[1].url ?? '';
    }
    notifyListeners();
  }

  // ignore: use_setters_to_change_properties
  void updateRepo(MeRepository repository) {
    _meRepository = repository;
  }

  MainNavigationProvider({
    required MeRepository meRepository,
  }) : _meRepository = meRepository;
}
