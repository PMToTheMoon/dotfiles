import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:zanalys/app/routes.dart';
import 'package:zanalys/auth/auth.dart';
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
    _setupPushNotificationsHandler();
  }

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  void _onAppStateChanged(BuildContext context, AuthState state) {
    if (state is Unauthenticated) {
      _navigator.pushNamedAndRemoveUntil(
        LoginPage.route,
        (route) => false,
      );
    }
    //TODO
    // if (state is UnexpectedErrorState) {
    //   showFatalError(context, message: context.l10n.try_later_error);
    // }
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
      create: (context) => AuthBloc(
        authService: GetIt.instance.get(),
      ),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
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

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    handlePushNotification(context, message.data);
  }
}
