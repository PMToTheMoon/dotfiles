import 'package:flutter/material.dart';

import 'package:zanalys/auth/signin/signin.dart';
import 'package:zanalys/hub/view/hub_page.dart';
import 'package:zanalys/splash/splash.dart';

const initialRoute = SplashPage.route;

final routes = <String, Widget Function(BuildContext)>{
  SplashPage.route: SplashPage.builder,
  SignInPage.route: SignInPage.builder,
  HubPage.route: HubPage.builder,
};
