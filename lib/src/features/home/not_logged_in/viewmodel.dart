// Flutter Modules
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// External Modules
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/authorization_response.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/constant.dart';
import 'package:challenge_for_skin_x/env/spotify_client.dart';
import 'package:challenge_for_skin_x/provider/main_navigation_provider.dart';

class NotLoggedInViewModel extends ChangeNotifier {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final MainNavigationProvider _mainNavigationProvider;

  Future<void> fetchSpotifyAccessToken() async {
    SpotifyOAuth2Client client = SpotifyOAuth2Client(
      customUriScheme: spotifyCustomUriScheme,
      redirectUri: spotifyRedirectUri,
    );

    try {
      AuthorizationResponse authResp = await client.requestAuthorization(
        clientId: SpotifyClient.clientId,
        customParams: spotifyCustomParams,
        scopes: spotifyScope,
      );

      AccessTokenResponse accessToken = await client.requestAccessToken(
        code: authResp.code.toString(),
        clientId: SpotifyClient.clientId,
        clientSecret: SpotifyClient.clientSecret,
      );

      await _secureStorage.write(
        key: accesTokenKey,
        value: accessToken.accessToken,
      );
      await _secureStorage.write(
        key: refreshTokenKey,
        value: accessToken.refreshToken,
      );
    } catch (e) {
      var err = e as PlatformException;
      await _secureStorage.delete(
        key: accesTokenKey,
      );
      await _secureStorage.delete(
        key: refreshTokenKey,
      );
      Fluttertoast.showToast(
        msg: err.message ?? '',
      );
    }

    await _mainNavigationProvider.getUserToken();
  }

  NotLoggedInViewModel({
    required BuildContext context,
  }) : _mainNavigationProvider = context.provide();
}
