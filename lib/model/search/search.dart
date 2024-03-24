// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/playlist.dart';

part 'search.g.dart';

@JsonSerializable(createToJson: false)
class Search {
  Playlist? playlists;

  Search({
    this.playlists,
  });

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);
}
