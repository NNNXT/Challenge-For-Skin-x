// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/tracks.dart';

class TracksResponse {
  final Tracks? result;

  TracksResponse({
    this.result,
  });

  TracksResponse.withError() : result = null;

  factory TracksResponse.fromJson(json) => TracksResponse(
        result: Tracks.fromJson(json as Map<String, dynamic>? ?? {}),
      );
}
