import 'package:app_chauffeur/pages/home/widgets/device_issues_detector.dart';
import 'package:app_chauffeur/pages/home/widgets/location_service_guard.dart';
import 'package:app_chauffeur/widgets/app_state_watcher.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:get/get.dart';

import 'package:app_chauffeur/permissions/permissions.dart';
import 'package:app_chauffeur/apis/urban_driver.dart' as urban_driver;
import 'package:app_chauffeur/app.dart';

import 'home_controller.dart';
export 'home_bindings.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PermissionGuard(
      requests: controller.permissionRequests,
      onDone: controller.launchServices,
      replacement: const Page(),
      child: LocationServiceGuard(
        locationService: controller.locationService,
        child: DeviceIssueDetector(
          child: AppStateWatcher(
            onAppResumed: controller.launchServices,
            child: Obx(
              () => AnimatedSwitcher(
                child: _buildContent(),
                duration: Feel.animationDuration,
                reverseDuration: Feel.animationDuration,
                switchInCurve: Feel.animationCurve,
                switchOutCurve: Feel.animationCurve,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    late Widget content;
    if (controller.webviewUrl != null) {
      content = Obx(() => WebViewPage(
            onAppBarBackButtonPressed: controller.quitWebView,
            navigationDelegate: controller.popScopeNavigationDelegate,
            onWebViewCreated: controller.onWebViewCreated,
            url: controller.webviewUrl,
          ));
    } else {
      content = Page(
        onRefresh: controller.onRefresh,
        body: Column(
          children: [
            Image.asset(
              "assets/urban_driver.png",
              fit: BoxFit.contain,
            ),

            RoundContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  controller.obx(_buildLinks),
                  const Divider(),
                  ElevatedButton(
                    onPressed: controller.logout,
                    child: Text("logout".tr),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Obx(() => Text(
                    controller.version,
                    style: const TextStyle(fontSize: 11),
                  )),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                TextButton(
                  onPressed: controller.openCGUWebview,
                  child: Text("cgu".tr),
                ),
                TextButton(
                  onPressed: controller.openContactWebview,
                  child: Text("contact".tr),
                ),
                TextButton(
                  onPressed: controller.openLegalMentionsWebview,
                  child: Text("legal_mentions".tr),
                ),
              ],
            ),
            // Spacer(),
          ],
        ),
      );
    }

    return content;
  }

  Widget _buildLinks(List<urban_driver.InterfaceLink>? links) => links == null
      ? const SizedBox.shrink()
      : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: links
              .map(
                (link) => ElevatedButton(
                  onPressed: () => controller.onSelectLink(link.url),
                  child: Text(link.texte),
                ),
              )
              .toList(),
        );
}
