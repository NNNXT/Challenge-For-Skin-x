// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/playlist.dart';

class PlaylistResponse {
  final Playlist? result;

  PlaylistResponse({
    this.result,
  });

  PlaylistResponse.withError() : result = null;

  factory PlaylistResponse.fromJson(json) => PlaylistResponse(
        result: Playlist.fromJson(json as Map<String, dynamic>? ?? {}),
      );
}
