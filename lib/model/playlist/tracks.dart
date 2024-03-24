// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/track_item.dart';

part 'tracks.g.dart';

@JsonSerializable(createToJson: false)
class Tracks {
  int total;

  int limit;

  List<TrackItem>? items;

  Tracks({
    this.total = 0,
    this.limit = 0,
    this.items,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);
}
