// External Modules
import 'package:json_annotation/json_annotation.dart';

part 'artists.g.dart';

@JsonSerializable(createToJson: false)
class Artists {
  String id;
  String name;

  Artists({
    this.id = '',
    this.name = '',
  });

  factory Artists.fromJson(Map<String, dynamic> json) => _$ArtistsFromJson(json);
}
