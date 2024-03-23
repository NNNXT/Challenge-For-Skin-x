// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_skin_x/model/user_profile/images.dart';

part 'user_profie.g.dart';

@JsonSerializable(createToJson: false)
class UserProfile {
  String country;

  @JsonKey(name: 'display_name')
  String displayName;

  String email;

  List<Images>? images;

  UserProfile({
    this.country = '',
    this.displayName = '',
    this.email = '',
    this.images,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}
