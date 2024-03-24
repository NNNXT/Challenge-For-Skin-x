// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/playlist_detail_response.dart';
import 'package:challenge_for_skin_x/model/playlist/tracks_response.dart';
import 'package:challenge_for_skin_x/network/network.dart';

class PlaylistRepository extends BaseRepository {
  final String _requestPlaylistDetail = 'v1/playlists/';

  Future<PlaylistDetailResponse> requestPlaylistDetail({
    required String playlistId,
  }) async {
    var response = await dataProvider.get<Map<String, dynamic>>(
      _requestPlaylistDetail + playlistId,
    );
    return PlaylistDetailResponse.fromJson(response.data);
  }

  Future<TracksResponse> requestPlaylistDetailTracks({
    required String playlistId,
    required int offset,
    required int limit,
  }) async {
    var response = await dataProvider.get<Map<String, dynamic>>(
      '$_requestPlaylistDetail$playlistId/tracks',
      queryParameters: {
        'offset': offset,
        'limit': limit,
      },
    );
    return TracksResponse.fromJson(response.data);
  }
}
