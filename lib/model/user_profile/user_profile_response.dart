// Internal Modules
import 'package:challenge_for_skin_x/model/user_profile/user_profie.dart';

class UserProfileResponse {
  final UserProfile? result;

  UserProfileResponse({
    this.result,
  });

  UserProfileResponse.withError() : result = null;

  factory UserProfileResponse.fromJson(json) => UserProfileResponse(
        result: UserProfile.fromJson(json as Map<String, dynamic>? ?? {}),
      );
}
