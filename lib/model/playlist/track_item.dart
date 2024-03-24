// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/track.dart';

part 'track_item.g.dart';

@JsonSerializable(createToJson: false)
class TrackItem {
  Track? track;

  TrackItem({
    this.track,
  });

  factory TrackItem.fromJson(Map<String, dynamic> json) => _$TrackItemFromJson(json);
}
