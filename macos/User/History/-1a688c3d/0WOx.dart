import 'package:common/common.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanalys/home/home.dart';
import 'package:zanalys/notifications/notifications.dart';

import 'home_body.dart';

class HomePage extends StatefulWidget {
  static const route = 'home';

  static HomePage builder(BuildContext context) => const HomePage();

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _handleLaunchPushNotification();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const Scaffold(
        bottomNavigationBar: ZanalysBottomNavigationBar(
          currentIndex: 0,
          onSelected: (_) =>
              Navigator.of(context).pushReplacementNamed(UIKitPage.route),
        ),
        body: HomeBody(),
      ),
    );
  }

  Future<void> _handleLaunchPushNotification() async {
    // RemoteMessage? initialMessage =
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      if (!mounted) return;
      await handlePushNotification(Navigator.of(context), message.data);
    }
  }
}
