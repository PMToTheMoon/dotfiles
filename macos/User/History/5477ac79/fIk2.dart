import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zanalys/app/app_services.dart';
import 'package:zanalys/authentication/signin/signin.dart';
import 'package:zanalys/home/view/home_page.dart';
import 'package:zanalys/splash/bloc/splash_bloc.dart';
import 'package:zanalys/splash/bloc/splash_state.dart';
import 'package:zanalys/utils/bloc_utils.dart';

import 'splash_body.dart';

class SplashPage extends StatefulWidget {
  static const String route = 'splash';

  static SplashPage builder(BuildContext context) => const SplashPage();

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const _timerDuration = 2500;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..fetchUserAuthenticated(),
      child: BlocCreatorWithListener<SplashBloc, SplashState>(
          listener: (context, state) {
            late final String nextRoute;
            switch (state.status) {
              case SplashStatus.authenticated:
                nextRoute = HomePage.route;
                break;
              case SplashStatus.unauthenticated:
                nextRoute = SignInPage.route;
                break;
              default:
                break;
            }
            if (nextRoute != null) {
              _timer = Timer(const Duration(milliseconds: _timerDuration), () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(nextRoute, (route) => false);
              });
            }
          },
          child: const Scaffold(
            body: SplashBody(),
          )),
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    super.dispose();
  }
}
