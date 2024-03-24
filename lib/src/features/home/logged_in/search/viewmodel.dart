// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/model/playlist/item.dart';
import 'package:challenge_for_skin_x/model/search/search_response.dart';
import 'package:challenge_for_skin_x/network/repository/search_repository.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchRepository _searchRepository;
  String _searchText = '';

  String get searchText => _searchText;
  bool isPlaylistLastPage = false;

  List<Item> listSearchs = [];

  Future<void> searchPlaylist({
    bool reload = false,
    int limit = 20,
  }) async {
    if ((isPlaylistLastPage && !reload) || _searchText.isEmpty) return;
    var begin = reload ? 0 : listSearchs.length;

    SearchResponse response = await _searchRepository.searchPlaylist(
      q: _searchText,
      offset: begin,
      limit: limit,
    );

    List<Item> listSearchsRes = response.result?.playlists?.items ?? [];

    if (reload) {
      listSearchs.clear();
    }

    if (_searchText.isNotEmpty) {
      listSearchs.addAll(listSearchsRes);
      isPlaylistLastPage = listSearchsRes.length < limit;
      notifyListeners();
    }
  }

  void clearSearchPlayList() {
    listSearchs.clear();
    notifyListeners();
  }

  set searchText(String value) {
    if (_searchText != value) {
      _searchText = value;
    }
  }

  SearchViewModel({
    required BuildContext context,
  }) : _searchRepository = context.provide();
}
