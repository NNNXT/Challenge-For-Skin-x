// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/album.dart';
import 'package:challenge_for_skin_x/model/playlist/artists.dart';

part 'track.g.dart';

@JsonSerializable(createToJson: false)
class Track {
  String id;

  String name;

  @JsonKey(name: 'duration_ms')
  int durationMs;

  String get prettyDurationMs => Duration(milliseconds: durationMs).toString().substring(3, 7);

  Album? album;

  List<Artists>? artists;

  String get artistsDisplay => artists?.map((artist) => artist.name).join(", ") ?? "";

  String uri;

  Track({
    this.id = '',
    this.name = '',
    this.durationMs = 0,
    this.album,
    this.artists,
    this.uri = '',
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}
