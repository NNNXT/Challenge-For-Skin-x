// Internal Modules
import 'package:challenge_for_skin_x/network/network.dart';

class UserRepository extends BaseRepository {
  final String _requestCurrentUserProfilePath = 'v1/users/';

  Future<void> addPlaylist({
    required String userId,
    required String playlistName,
  }) async {
    await dataProvider.post<Map<String, dynamic>>(
      '${_requestCurrentUserProfilePath + userId}/playlists',
      data: {
        "name": playlistName,
      },
    );
  }
}
