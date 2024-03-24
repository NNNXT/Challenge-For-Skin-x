// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/browse_playlist.dart';

class BrowsePlaylistResponse {
  final BrowsePlaylist? result;

  BrowsePlaylistResponse({
    this.result,
  });

  BrowsePlaylistResponse.withError() : result = null;

  factory BrowsePlaylistResponse.fromJson(json) => BrowsePlaylistResponse(
        result: BrowsePlaylist.fromJson(json as Map<String, dynamic>? ?? {}),
      );
}
