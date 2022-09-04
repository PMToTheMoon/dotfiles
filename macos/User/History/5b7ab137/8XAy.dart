import 'package:flutter/material.dart';
import 'package:zanalys/authentication/otp/otp_screen.dart';
import 'package:zanalys/authentication/signin/signin_screen.dart';
import 'package:zanalys/home/home_screen.dart';
import 'package:zanalys/splash/splash_screen.dart';
import 'package:zanalys/upload_document/upload_document_screen.dart';

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
        builder = (BuildContext context) => const SplashScreen();
        break;
      case routeSignIn:
        builder = (BuildContext context) =>
            SignInScreen(args: settings.arguments as SignInScreenArgs?);
        break;
      case routeHome:
        builder = (BuildContext context) => const HomeScreen();
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
