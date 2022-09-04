import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CacheService extends GetxService {
  static CacheService get instance => Get.find<CacheService>();

  Map<int, Color> _songArtworksDominantColor = {};
  Map<int, Color> _albumArtworksDominantColor = {};

  void cacheSongDominantColor(int songID, Color color) =>
      _songArtworksDominantColor[songID] = color;

  Color? cachedSongDominantColor(int songID) =>
      _songArtworksDominantColor[songID];

  void cacheAlbumDominantColor(int albumID, Color color) =>
      _albumArtworksDominantColor[albumID] = color;

  Color? cachedAlbumDominantColor(int albumID) =>
      _albumArtworksDominantColor[albumID];

  void clear() {
    _songArtworksDominantColor = {};
    _albumArtworksDominantColor = {};
  }
}
