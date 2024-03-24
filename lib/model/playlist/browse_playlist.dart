// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_skin_x/model/playlist/playlist.dart';

part 'browse_playlist.g.dart';

@JsonSerializable(createToJson: false)
class BrowsePlaylist {
  Playlist? playlists;

  BrowsePlaylist({
    this.playlists,
  });

  factory BrowsePlaylist.fromJson(Map<String, dynamic> json) => _$BrowsePlaylistFromJson(json);
}
