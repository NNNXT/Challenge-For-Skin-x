// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_skin_x/model/images.dart';

part 'item.g.dart';

@JsonSerializable(createToJson: false)
class Item {
  String description;

  String id;

  List<Images>? images;

  String get toLargestImage =>
      (images ?? []).reduce((largest, image) => image.width > largest.width ? image : largest).url;

  String name;

  Item({
    this.description = '',
    this.id = '',
    this.images,
    this.name = '',
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
