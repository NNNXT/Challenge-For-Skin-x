// Flutter Modules
import 'package:challenge_for_skin_x/provider/main_navigation_provider.dart';
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/model/playlist/item.dart';
import 'package:challenge_for_skin_x/model/playlist/playlist_response.dart';
import 'package:challenge_for_skin_x/network/repository/me_repository.dart';
import 'package:challenge_for_skin_x/network/repository/user_repository.dart';

class LibraryViewModel extends ChangeNotifier {
  final MeRepository _meRepository;
  final UserRepository _userRepository;
  final MainNavigationProvider _mainNavigationProvider;

  List<Item> listItems = [];

  bool isPlaylistLastPage = false;

  Future<void> addPlaylist({
    required String playlistName,
  }) async {
    await _userRepository.addPlaylist(
      userId: _mainNavigationProvider.userProfile?.id ?? '',
      playlistName: playlistName,
    );
  }

  Future<void> requestPlaylist({
    bool reload = false,
    int limit = 20,
  }) async {
    if (isPlaylistLastPage && !reload) return;
    var begin = reload ? 0 : listItems.length;

    PlaylistResponse response = await _meRepository.requestMePlaylist(
      offset: begin,
      limit: limit,
    );

    List<Item> listItemsRes = response.result?.items ?? [];

    if (reload) {
      listItems.clear();
    }

    listItems.addAll(listItemsRes);
    isPlaylistLastPage = listItemsRes.length < limit;
    notifyListeners();
  }

  LibraryViewModel({
    required BuildContext context,
  })  : _meRepository = context.provide(),
        _userRepository = context.provide(),
        _mainNavigationProvider = context.provide();
}
