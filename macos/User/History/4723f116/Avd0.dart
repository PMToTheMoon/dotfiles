import 'package:flutter/material.dart';
import 'package:zanalys/authentication/otp/otp_screen.dart';
import 'package:zanalys/authentication/signin/signin_screen.dart';
import 'package:zanalys/upload_document/view/upload_document_page.dart';
import 'package:zanalys/routing/navigation_service.dart';
import 'package:zanalys/routing/zanalys_router.dart';

class ZanalysNavigationService implements NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  to(String routeName, {dynamic arguments, bool? clearStack}) {
    if (clearStack == true) {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
          routeName, (r) => false,
          arguments: arguments);
    } else {
      navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
    }
  }

  @override
  handlePushNotification(Map<String, dynamic> data) {
    String code;
    if (data.containsKey('code')) {
      code = data['code'];
      toDocumentUpload(args: UploadDocumentScreenArgs(accessCode: code));
    } else {
      toDocumentUpload();
    }
  }

  @override
  void back() {
    navigatorKey.currentState?.pop();
  }

  @override
  toDocumentUpload({UploadDocumentScreenArgs? args}) {
    to(ZanalysRouter.routeDocumentUpload, arguments: args);
  }

  @override
  toHome() {
    to(ZanalysRouter.routeHome, clearStack: true);
  }

  @override
  toOTP(OTPScreenArgs args) {
    to(ZanalysRouter.routeOTP, arguments: args);
  }

  @override
  toSignIn({bool? forced}) {
    to(ZanalysRouter.routeSignIn,
        arguments:
            forced == true ? SignInScreenArgs(isForcedLogout: true) : null);
  }
}
