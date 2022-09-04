import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:unusable_player/unusable_player.dart' as up;

class ThemeService extends GetxService with Translations {
  static ThemeService get instance => Get.find<ThemeService>();

  static const Locale theme = Locale("en_US");
  static Locale? get initialLocale => Get.deviceLocale;

  late final _cache;

  Future<ThemeService> init() async {
    _cache = await Hive.openBox('testBox');
    return this;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        // 'fr_FR': frFR,
      };
}
