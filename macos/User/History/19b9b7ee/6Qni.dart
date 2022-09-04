import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:unusable_player/unusable_player.dart' as up;

const String _kIsLightModeKey = "lightTheme";

class ThemeService extends GetxService {
  static ThemeService get instance => Get.find<ThemeService>();

  late final Box<bool> _cache;

  final themeMode = ThemeMode.light.obs;

  Future<ThemeService> init() async {
    _cache = await Hive.openBox('theme_mode');
    final isLightThemeMode = _cache.get(_kIsLightModeKey) ?? true;
    if (isLightThemeMode) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.dark;
    }
    return this;
  }

  enableDarkTheme() async {
    if (Get.isDarkMode == false) {
      up.CacheService.instance.clear();
    }
    await _cache.put(_kIsLightModeKey, false);
    Get.changeThemeMode(ThemeMode.dark);
    themeMode.value = ThemeMode.dark;
  }

  enableLightTheme() async {
    if (Get.isDarkMode == true) {
      up.CacheService.instance.clear();
    }
    await _cache.put(_kIsLightModeKey, true);
    Get.changeThemeMode(ThemeMode.light);
    themeMode.value = ThemeMode.light;
  }

  switchThemeMode() async {
    if (Get.isDarkMode) {
      return enableLightTheme();
    } else {
      return enableDarkTheme();
    }
  }
}
