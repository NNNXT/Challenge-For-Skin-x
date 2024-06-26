// Flutter Modules
import 'package:flutter/material.dart';

// color
Color mainColor = const Color(0xFF1DB954);
Color backgroundColor = const Color(0xFF121212);

// Spotify
String spotifyCustomUriScheme = 'my.challenge.skinx.app';
String spotifyRedirectUri = 'my.challenge.skinx.app://callback';

Map<String, dynamic> spotifyCustomParams = {'show_dialog': 'true'};
List<String> spotifyScope = [
  'user-read-private',
  'user-read-email',
  'playlist-read-private',
  'playlist-modify-public',
  'playlist-modify-private',
];

// Secure Storage
String accesTokenKey = 'accesTokenKey';
String refreshTokenKey = 'refreshTokenKey';
