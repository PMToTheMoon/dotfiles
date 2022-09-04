import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:zanalys/app/routes.dart';
import 'package:zanalys/splash/splash.dart';
import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/home/home.dart';
import 'package:zanalys/notifications/notifications.dart';

import 'services.dart';
import 'routes.dart';

class ZanalysApp extends StatefulWidget {
  const ZanalysApp({Key? key}) : super(key: key);

  @override
  State createState() => _ZanalysAppState();
}

class _ZanalysAppState extends State<ZanalysApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _setupPushNotificationsHandler());
  }

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  ScaffoldMessengerState get _scaffoldMessenger =>
      _scaffoldMessengerKey.currentState!;

  AuthBloc _createAuthBloc(BuildContext context) {
    final bloc = AuthBloc(
      authService: GetIt.instance.get(),
    );
    Future.delayed(
      kSplashScreenDuration,
      () => bloc.add(const AuthEvent.started()),
    );
    return bloc;
  }

  void _onAppStateChanged(BuildContext context, AuthState state) {
    if (state is Unauthenticated) {
      _navigator.pushNamedAndRemoveUntil(
        SignInPage.route,
        (route) => false,
      );
    }
    if (state is Authenticated) {
      _navigator.pushNamedAndRemoveUntil(
        HomePage.route,
        (route) => false,
      );
    }
  }

  Widget _navigatorBuilder(BuildContext c, Widget? navigator) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      listener: _onAppStateChanged,
      child: navigator ?? const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: _createAuthBloc,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        scaffoldMessengerKey: _scaffoldMessengerKey,
        builder: _navigatorBuilder,
        theme: zanalysTheme,
        initialRoute: initialRoute,
        routes: routes,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }

  // TODO: rework notifications
  // [ ] Better ask permissions
  Future<void> _setupPushNotificationsHandler() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance
          .requestPermission(alert: true, sound: true);
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
      var authToken = await AppServices.storage.getToken();
      if (authToken != null) {
        await AppServices.user.updatePushToken(token: token);
      }
    });

    FirebaseMessaging.onMessage.listen(_handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (AppServices.auth.status.) {
      handlePushNotification(_navigator, message.data);
    } else {
      _scaffoldMessenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text(
                'Vous devez être connecté pour ajouter une image au dossier.'),
          ),
        );
    }
  }
}
