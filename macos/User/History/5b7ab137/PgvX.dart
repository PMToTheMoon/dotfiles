import 'package:flutter/material.dart';
import 'package:zanalys/authentication/otp/otp_screen.dart';
import 'package:zanalys/authentication/signin/signin_screen.dart';
import 'package:zanalys/home/view/home_page.dart';
import 'package:zanalys/splash/view/splash_page.dart';
import 'package:zanalys/upload_document/view/upload_document_page.dart';

class ZanalysRouter {
  static const String routeSplash = 'splash';
  static const String routeSignIn = 'signIn';
  static const String routeHome = 'home';
  static const String routeOTP = 'otp';
  static const String routeDocumentUpload = 'uploadDocument';

  const ZanalysRouter._();

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    WidgetBuilder builder;

    String? routeName = settings.name;

    switch (routeName) {
      case routeSplash:
        builder = (BuildContext context) => const SplashPage();
        break;
      case routeSignIn:
        builder = (BuildContext context) =>
            SignInScreen(args: settings.arguments as SignInScreenArgs?);
        break;
      case routeHome:
        builder = (BuildContext context) => const HomePage();
        break;
      case routeOTP:
        builder = (BuildContext context) => OTPScreen(
              args: settings.arguments as OTPScreenArgs,
            );
        break;
      case routeDocumentUpload:
        builder = (BuildContext context) => UploadDocumentScreen(
              args: settings.arguments as UploadDocumentScreenArgs?,
            );
        break;
      default:
        throw ("ZanalysRouter can't handle the route named: $routeName");
    }

    return MaterialPageRoute(builder: builder);
  }
}
