// Internal Modules
import 'package:challenge_for_skin_x/model/search/search.dart';

class SearchResponse {
  final Search? result;

  SearchResponse({
    this.result,
  });

  SearchResponse.withError() : result = null;

  factory SearchResponse.fromJson(json) => SearchResponse(
        result: Search.fromJson(json as Map<String, dynamic>? ?? {}),
      );
}
