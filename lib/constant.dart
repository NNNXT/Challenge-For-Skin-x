// Spotify
String spotifyCustomUriScheme = 'my.challenge.skinx.app';
String spotifyRedirectUri = 'my.challenge.skinx.app://callback';

Map<String, dynamic> spotifyCustomParams = {'show_dialog': 'true'};
List<String> spotifyScope = [
  'user-read-private',
  'user-read-playback-state',
  'user-modify-playback-state',
  'user-read-currently-playing',
  'user-read-email',
];

// Secure Storage
String accesTokenKey = 'accesTokenKey';
String refreshTokenKey = 'refreshTokenKey';
