// Internal Modules
import 'package:challenge_for_skin_x/model/user_profile/user_profie.dart';

class UserProfileResponse {
  final UserProfile? result;
  // final AppError? error;

  UserProfileResponse({
    this.result,
    // this.error,
  });

  UserProfileResponse.withError() : result = null;

  factory UserProfileResponse.fromJson(json) => UserProfileResponse(
        result: UserProfile.fromJson(json as Map<String, dynamic>? ?? {}),
        // error: null,
      );
}
