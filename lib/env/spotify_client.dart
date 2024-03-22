// External Modules
import 'package:envied/envied.dart';

part 'spotify_client.g.dart';

@Envied(path: 'spotify_client.env')
abstract class SpotifyClient {
  @EnviedField(varName: 'SPOTIFY_CLIENT_ID', obfuscate: true)
  static String clientId = _SpotifyClient.clientId;

  @EnviedField(varName: 'SPOTIFY_CLIENT_SECRET', obfuscate: true)
  static String clientSecret = _SpotifyClient.clientSecret;
}
