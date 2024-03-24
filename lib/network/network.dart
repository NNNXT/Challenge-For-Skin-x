// External Modules
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';

// Internal Modules
import 'package:challenge_for_skin_x/constant.dart';
import 'package:challenge_for_skin_x/env/spotify_client.dart';

abstract class BaseRepository {
  Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Dio get dataProvider => _dio;

  BaseRepository() {
    String baseUrl = 'https://api.spotify.com/';
    BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      baseUrl: baseUrl,
    );
    _dio = Dio(options);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String accessToken = await _secureStorage.read(key: accesTokenKey) ?? '';
          options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            await refetchSpotifyAccessToken();
            String accessTokenNew = await _secureStorage.read(key: accesTokenKey) ?? '';

            e.requestOptions.headers['Authorization'] = 'Bearer $accessTokenNew';

            return handler.resolve(await _dio.fetch(e.requestOptions));
          } else {
            Fluttertoast.showToast(
              msg: e.response?.statusMessage ?? '',
              timeInSecForIosWeb: 8,
            );
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<void> refetchSpotifyAccessToken() async {
    SpotifyOAuth2Client client = SpotifyOAuth2Client(
      customUriScheme: spotifyCustomUriScheme,
      redirectUri: spotifyRedirectUri,
    );

    String refreshToken = await _secureStorage.read(key: refreshTokenKey) ?? '';

    AccessTokenResponse accessToken = await client.refreshToken(
      refreshToken,
      clientId: SpotifyClient.clientId,
      clientSecret: SpotifyClient.clientSecret,
    );

    if (accessToken.error == null) {
      await _secureStorage.write(
        key: accesTokenKey,
        value: accessToken.accessToken,
      );
      await _secureStorage.write(
        key: refreshTokenKey,
        value: accessToken.refreshToken,
      );
    } else {
      await _secureStorage.delete(
        key: accesTokenKey,
      );
      await _secureStorage.delete(
        key: refreshTokenKey,
      );
      Fluttertoast.showToast(
        msg: accessToken.error ?? '',
      );
    }
  }
}
