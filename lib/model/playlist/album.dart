// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_skin_x/model/images.dart';

part 'album.g.dart';

@JsonSerializable(createToJson: false)
class Album {
  String id;
  String name;

  List<Images>? images;

  String get toLargestImage =>
      (images ?? []).reduce((largest, image) => image.width > largest.width ? image : largest).url;

  Album({
    this.id = '',
    this.name = '',
    this.images,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
