import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zanalys/app/app_services.dart';
import 'package:zanalys/splash/bloc/splash_bloc.dart';
import 'package:zanalys/splash/bloc/splash_state.dart';
import 'package:zanalys/routing/zanalys_router.dart';
import 'package:zanalys/utils/bloc_utils.dart';

import 'splash_body.dart';

class SplashScreen extends StatefulWidget {
  static SplashScreen open(BuildContext context) => const SplashScreen();

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const _timerDuration = 2500;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return BlocCreatorWithListener<SplashBloc, SplashState>(
        create: (context) => SplashBloc()..fetchUserAuthenticated(),
        listener: (context, state) {
          String? nextRoute;
          switch (state.status) {
            case SplashStatus.authenticated:
              nextRoute = ZanalysRouter.routeHome;
              break;
            case SplashStatus.unauthenticated:
              nextRoute = ZanalysRouter.routeSignIn;
              break;
            default:
              break;
          }
          if (nextRoute != null) {
            _timer = Timer(const Duration(milliseconds: _timerDuration), () {
              AppServices.navigation.to(nextRoute!, clearStack: true);
            });
          }
        },
        child: const Scaffold(
          body: SplashBody(),
        ));
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
