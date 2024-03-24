// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/model/playlist/item.dart';
import 'package:challenge_for_skin_x/model/playlist/playlist_response.dart';
import 'package:challenge_for_skin_x/network/repository/me_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final MeRepository _meRepository;

  List<Item> listItems = [];

  bool isPlaylistLastPage = false;

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

  HomeViewModel({
    required BuildContext context,
  }) : _meRepository = context.provide();
}
