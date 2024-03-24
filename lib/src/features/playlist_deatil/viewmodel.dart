// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/model/playlist/playlist_detail.dart';
import 'package:challenge_for_skin_x/model/playlist/playlist_detail_response.dart';
import 'package:challenge_for_skin_x/model/playlist/track_item.dart';
import 'package:challenge_for_skin_x/model/playlist/tracks_response.dart';
import 'package:challenge_for_skin_x/network/repository/playlist_repository.dart';

class PlaylistDetailViewModel extends ChangeNotifier {
  final PlaylistRepository _playlistRepository;

  List<TrackItem> listTracks = [];

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

  PlaylistDetailViewModel({
    required BuildContext context,
  }) : _playlistRepository = context.provide();
}
