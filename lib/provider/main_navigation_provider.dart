// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Internal Modules
import 'package:challenge_for_skin_x/constant.dart';
import 'package:challenge_for_skin_x/model/user_profile/user_profie.dart';
import 'package:challenge_for_skin_x/model/user_profile/user_profile_response.dart';
import 'package:challenge_for_skin_x/network/repository/me_repository.dart';

class MainNavigationProvider extends ChangeNotifier {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  MeRepository _meRepository;

  bool _isLoggedIn = false;
  UserProfile? _userProfile;

  bool get isLoggedIn => _isLoggedIn;
  UserProfile? get userProfile => _userProfile;

  Future<void> getUserToken() async {
    String userToken = await _secureStorage.read(key: accesTokenKey) ?? '';

    _isLoggedIn = userToken.isNotEmpty;

    if (_isLoggedIn) {
      UserProfileResponse response = await _meRepository.requestCurrentUserProfile();
      _userProfile = response.result;
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
