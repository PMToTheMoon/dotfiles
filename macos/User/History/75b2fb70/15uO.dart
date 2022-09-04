import 'package:app_chauffeur/widgets/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'troubleshot_power_saving_controller.dart';

export 'troubleshot_power_saving_bindings.dart';

class TroubleshotPowerSavingPage
    extends GetView<TroubleshotPowerSavingController> {
  const TroubleshotPowerSavingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (url) => WebViewPage(
        onAppBarBackButtonPressed: controller.webViewGoBack,
        navigationDelegate: controller.popScopeNavigationDelegate,
        url: url ?? TroubleshotPowerSavingController.baseUrl,
        onWebViewCreated: controller.onWebViewCreated,
      ),
    );
  }
}
