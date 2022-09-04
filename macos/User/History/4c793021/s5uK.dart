import 'package:app_chauffeur/apis/urban_driver.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'app.dart';

Future<void> main() async {
  Config.ensureIsValid();
  WidgetsFlutterBinding.ensureInitialized();
  initUrbanDriverAPI();
  await initServices();
  runApp(const AppChauffeur());
}

class AppChauffeur extends StatelessWidget {
  const AppChauffeur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: Pages.initial,
      getPages: Pages.pages,
      translations: LangService(),
      locale: LangService.initialLocale,
      fallbackLocale: LangService.fallbackLocale,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}

Future<void> initServices() async {
  await Future.wait([
    Get.putAsync(() => LangService().init()),
    Get.putAsync(() => CacheService().init()),
  ]);
  Get.lazyPut(() => LocationService());
  Get.put(AuthService(
    cacheService: CacheService.instance,
  ));
  await Get.putAsync(() => FirebaseService(
        authService: AuthService.instance,
      ).init());
}
