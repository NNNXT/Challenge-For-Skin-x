// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/browse_playlist_response.dart';
import 'package:challenge_for_skin_x/network/network.dart';

class BrowseRepository extends BaseRepository {
  final String _requestCurrentUserProfilePath = 'v1/browse/featured-playlists';

  Future<BrowsePlaylistResponse> requestBrowsePlaylist({
    required int offset,
    required int limit,
  }) async {
    var response = await dataProvider.get<Map<String, dynamic>>(
      _requestCurrentUserProfilePath,
      queryParameters: {
        'offset': offset,
        'limit': limit,
      },
    );
    return BrowsePlaylistResponse.fromJson(response.data);
  }
}
