// Internal Modules
import 'package:challenge_for_skin_x/model/search/search_response.dart';
import 'package:challenge_for_skin_x/network/network.dart';

class SearchRepository extends BaseRepository {
  final String _requestSearchPlaylistPath = 'v1/search';

  Future<SearchResponse> searchPlaylist({
    required int offset,
    required int limit,
    required String q,
  }) async {
    var response = await dataProvider.get<Map<String, dynamic>>(
      _requestSearchPlaylistPath,
      queryParameters: {
        'q': q,
        'offset': offset,
        'limit': limit,
        'type': 'playlist',
        'market': 'th',
      },
    );
    return SearchResponse.fromJson(response.data);
  }
}
