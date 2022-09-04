import 'package:app_client/reservation/reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:common/common.dart';

import 'package:app_client/config.dart';
import 'package:app_client/app/app.dart';
import 'package:app_client/user/user.dart';
import 'package:app_client/auth/auth.dart';

Future<void> main() async {
  Config.ensureIsValid();
  ErrorWidget.builder = errorWidgetBuilder;
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await FlutterLibphonenumber().init();
  final authRepository = await AuthRepository().init();
  final userRepository = UserRepository(authRepository: authRepository);
  final reservationRepository = await ReservationRepository(
    userRepository: userRepository,
    authRepository: authRepository,
  ).init();
  runApp(
    App(
      authRepository: authRepository,
      userRepository: userRepository,
      reservationRepository: reservationRepository,
    ),
  );
}
