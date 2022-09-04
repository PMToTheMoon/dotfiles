import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:unusable_player/unusable_player.dart' as up;

const String _kThemeKey = "theme";

enum _Theme {
  light,
  dark,
}

class ThemeService extends GetxService {
  static ThemeService get instance => Get.find<ThemeService>();

  late final Box<_Theme> _cache;

  Future<ThemeService> init() async {
    _cache = await Hive.openBox('testBox');
    return this;
  }

  ThemeData get theme {
    final current = _cache.get(_kThemeKey) ?? _Theme.light;
    switch (current) {
      case _Theme.light:
        return up.lightTheme;
      case _Theme.dark:
        return up.darkTheme;
    }
  }
}
