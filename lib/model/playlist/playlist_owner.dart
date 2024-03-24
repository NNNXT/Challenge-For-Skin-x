// External Modules
import 'package:json_annotation/json_annotation.dart';

part 'playlist_owner.g.dart';

@JsonSerializable(createToJson: false)
class PlaylistOwner {
  @JsonKey(name: 'display_name')
  String displayName;

  PlaylistOwner({
    this.displayName = '',
  });

  factory PlaylistOwner.fromJson(Map<String, dynamic> json) => _$PlaylistOwnerFromJson(json);
}
