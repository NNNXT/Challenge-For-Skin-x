// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_skin_x/model/images.dart';
import 'package:challenge_for_skin_x/model/playlist/playlist_owner.dart';

part 'playlist_detail.g.dart';

@JsonSerializable(createToJson: false)
class PlaylistDetail {
  String description;
  String name;

  List<Images>? images;

  PlaylistOwner? owner;

  String get toLargestImage =>
      (images ?? []).reduce((largest, image) => image.width > largest.width ? image : largest).url;

  PlaylistDetail({
    this.description = '',
    this.name = '',
    this.owner,
  });

  factory PlaylistDetail.fromJson(Map<String, dynamic> json) => _$PlaylistDetailFromJson(json);
}
