// Internal Modules
import 'package:challenge_for_skin_x/model/user_profile/user_profile_response.dart';
import 'package:challenge_for_skin_x/network/network.dart';

class MeRepository extends BaseRepository {
  final String _requestCurrentUserProfilePath = 'v1/me';

  Future<UserProfileResponse> requestCurrentUserProfile() async {
    var response = await dataProvider.get<Map<String, dynamic>>(
      _requestCurrentUserProfilePath,
    );

    return UserProfileResponse.fromJson(response.data);
  }
}
