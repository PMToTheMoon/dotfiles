import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanalys/auth/signin/signin.dart';
import 'package:zanalys/home/view/home_page.dart';
import 'package:zanalys/splash/bloc/splash_bloc.dart';
import 'package:zanalys/splash/bloc/splash_event.dart';
import 'package:zanalys/splash/bloc/splash_state.dart';

import 'splash_body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashBody();
  }
}
