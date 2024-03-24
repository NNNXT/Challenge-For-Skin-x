// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/model/playlist/browse_playlist_response.dart';
import 'package:challenge_for_skin_x/model/playlist/item.dart';
import 'package:challenge_for_skin_x/network/repository/browse_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final BrowseRepository _browseRepository;

  List<Item> listItems = [];

  bool isPlaylistLastPage = false;

  Future<void> requestPlaylist({
    bool reload = false,
    int limit = 20,
  }) async {
    if (isPlaylistLastPage && !reload) return;
    var begin = reload ? 0 : listItems.length;

    BrowsePlaylistResponse response = await _browseRepository.requestBrowsePlaylist(
      offset: begin,
      limit: limit,
    );

    List<Item> listItemsRes = response.result!.playlists?.items ?? [];

    if (reload) {
      listItems.clear();
    }

    listItems.addAll(listItemsRes);
    isPlaylistLastPage = listItemsRes.length < limit;
    notifyListeners();
  }

  HomeViewModel({
    required BuildContext context,
  }) : _browseRepository = context.provide();
}
