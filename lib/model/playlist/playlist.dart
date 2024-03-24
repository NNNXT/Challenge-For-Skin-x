// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/item.dart';

part 'playlist.g.dart';

@JsonSerializable(createToJson: false)
class Playlist {
  int total;

  List<Item>? items;

  Playlist({
    this.total = 0,
    this.items,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);
}
