import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'jp_jp.dart';
import 'en_us.dart';

const String _kLocalKey = "locale";

class LangService extends GetxService with Translations {
  static LangService get instance => Get.find<LangService>();

  static const Locale fallbackLocale = Locale("en_US");
  static Locale? get initialLocale {
    final String? language = _cache.get(_kLocalKey);
    Get.deviceLocale;
  }

  late final Box<String> _cache;

  Future<LangService> init() async {
    _cache = await Hive.openBox('theme_mode');
    return this;
  }

  Future<void> switchTo(Locale locale) async {
    _cache.put(_kLocalKey, locale.languageCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'jp_JP': jpJP,
      };
}
