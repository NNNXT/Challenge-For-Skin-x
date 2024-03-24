// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/playlist_response.dart';
import 'package:challenge_for_skin_x/model/user_profile/user_profile_response.dart';
import 'package:challenge_for_skin_x/network/network.dart';

class MeRepository extends BaseRepository {
  final String _requestCurrentUserProfilePath = 'v1/me';
  final String _requestMePlaylistPath = 'v1/me/playlists';

  Future<UserProfileResponse> requestCurrentUserProfile() async {
    var response = await dataProvider.get<Map<String, dynamic>>(
      _requestCurrentUserProfilePath,
    );
    return UserProfileResponse.fromJson(response.data);
  }

  Future<PlaylistResponse> requestMePlaylist({
    required int offset,
    required int limit,
  }) async {
    var response = await dataProvider.get<Map<String, dynamic>>(
      _requestMePlaylistPath,
      queryParameters: {
        'offset': offset,
        'limit': limit,
      },
    );
    return PlaylistResponse.fromJson(response.data);
  }
}
