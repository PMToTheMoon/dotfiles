import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'jp_jp.dart';
import 'en_us.dart';

class LangService extends GetxService with Translations {
  static LangService get instance => Get.find<LangService>();

  static const Locale fallbackLocale = Locale("en_US");
  static Locale? get initialLocale => Get.deviceLocale;

  late final Box<bool> _cache;

  Future<LangService> init() async {
    _cache = await Hive.openBox('theme_mode');
    return this;
  }

  Future<void> switchTo(Locale locale) async {
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'jp_JP': jpJP,
      };
}
