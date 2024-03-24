// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/playlist_detail.dart';

class PlaylistDetailResponse {
  final PlaylistDetail? result;

  PlaylistDetailResponse({
    this.result,
  });

  PlaylistDetailResponse.withError() : result = null;

  factory PlaylistDetailResponse.fromJson(json) => PlaylistDetailResponse(
        result: PlaylistDetail.fromJson(json as Map<String, dynamic>? ?? {}),
      );
}
