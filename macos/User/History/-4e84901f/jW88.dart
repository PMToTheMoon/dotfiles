import 'package:flutter/material.dart';

import 'package:zanalys/auth/signin/signin.dart';
import 'package:zanalys/hub/hub.dart';
import 'package:zanalys/splash/splash.dart';

const initialRoute = SplashPage.route;

final routes = <String, Widget Function(BuildContext)>{
  SplashPage.route: SplashPage.builder,
  SignInPage.route: SignInPage.builder,
  Root.route: Root.builder,
};
