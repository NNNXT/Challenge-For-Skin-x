// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/model/playlist/item.dart';
import 'package:challenge_for_skin_x/model/playlist/playlist_detail.dart';
import 'package:challenge_for_skin_x/model/playlist/playlist_detail_response.dart';
import 'package:challenge_for_skin_x/model/playlist/playlist_response.dart';
import 'package:challenge_for_skin_x/model/playlist/track_item.dart';
import 'package:challenge_for_skin_x/model/playlist/tracks_response.dart';
import 'package:challenge_for_skin_x/network/repository/me_repository.dart';
import 'package:challenge_for_skin_x/network/repository/playlist_repository.dart';

class PlaylistDetailViewModel extends ChangeNotifier {
  final MeRepository _meRepository;
  final PlaylistRepository _playlistRepository;

  List<TrackItem> listTracks = [];

  List<Item> listItems = [];

  PlaylistDetail? _playlistDetail;

  PlaylistDetail? get playlistDetail => _playlistDetail;

  bool isTracksLastPage = false;

  Future<void> requestPlaylistDetailTracks({
    required String playlistId,
    int limit = 100,
  }) async {
    if (isTracksLastPage) return;
    var begin = listTracks.length;

    TracksResponse response = await _playlistRepository.requestPlaylistDetailTracks(
      playlistId: playlistId,
      offset: begin,
      limit: limit,
    );

    List<TrackItem> listTracksRes = response.result?.items ?? [];

    listTracks.addAll(listTracksRes);
    isTracksLastPage = listTracksRes.length < limit;
    notifyListeners();
  }

  Future<void> requestPlaylistDetail({
    required String playlistId,
  }) async {
    PlaylistDetailResponse response = await _playlistRepository.requestPlaylistDetail(
      playlistId: playlistId,
    );

    _playlistDetail = response.result;
    notifyListeners();
  }

  Future<void> requestPlaylist({
    bool reload = false,
  }) async {
    PlaylistResponse response = await _meRepository.requestMePlaylist(
      offset: 0,
      limit: 0,
      sendParameters: false,
    );

    List<Item> listItemsRes = response.result?.items ?? [];

    listItems.addAll(listItemsRes);
    notifyListeners();
  }

  Future<void> addItemsToPlasyList({
    required String playlistId,
    required String trackURI,
  }) async {
    await _playlistRepository.addItemsToPlasyList(
      playlistId: playlistId,
      trackURI: trackURI,
    );
  }

  PlaylistDetailViewModel({
    required BuildContext context,
  })  : _playlistRepository = context.provide(),
        _meRepository = context.provide();
}
