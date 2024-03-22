// External Modules
import 'package:dio/dio.dart';

abstract class BaseRepository {
  Dio _dio = Dio();

  Dio get dataProvider => _dio;

  BaseRepository() {
    String baseUrl = '';
    BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      baseUrl: baseUrl,
    );
    _dio = Dio(options);
  }
}
