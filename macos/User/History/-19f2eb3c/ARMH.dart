import 'package:flutter/material.dart';

import 'package:zanalys/auth/signin/signin.dart';
import 'package:zanalys/splash/splash.dart';
import 'package:zanalys/home/home.dart';
import 'package:zanalys/ui_kit/view/ui_kit_page.dart';

const initialRoute = SplashPage.route;

final routes = <String, Widget Function(BuildContext)>{
  UIKitPage.route: UIKitPage.builder,
  SplashPage.route: SplashPage.builder,
  SignInPage.route: SignInPage.builder,
  HomePage.route: HomePage.builder,
};
