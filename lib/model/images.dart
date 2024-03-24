// External Modules
import 'package:json_annotation/json_annotation.dart';

part 'images.g.dart';

@JsonSerializable(createToJson: false)
class Images {
  String url;

  num height;

  num width;

  Images({
    this.url = '',
    this.height = 0.0,
    this.width = 0.0,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}
