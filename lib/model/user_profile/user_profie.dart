// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_skin_x/model/user_profile/images.dart';

part 'user_profie.g.dart';

@JsonSerializable(createToJson: false)
class UserProfile {
  @JsonKey(name: 'display_name')
  String displayName;

  List<Images>? images;

  String get toLargestImage =>
      (images ?? []).reduce((largest, image) => image.width > largest.width ? image : largest).url;

  UserProfile({
    this.displayName = '',
    this.images,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}
