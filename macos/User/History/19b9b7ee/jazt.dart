import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unusable_player/services/lang_service/en_us.dart';
import 'package:unusable_player/services/lang_service/fr_FR.dart';

class ThemeService extends GetxService with Translations {
  static ThemeService get instance => Get.find<ThemeService>();

  static const Locale fallbackLocale = Locale("en_US");
  static Locale? get initialLocale => Get.deviceLocale;

  Future<ThemeService> init() async {
    return this;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        // 'fr_FR': frFR,
      };
}
