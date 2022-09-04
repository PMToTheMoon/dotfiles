import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:tech_by_tech/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: initialRoute,
      routes: routes,
      theme: lightTheme,
    );
  }
}
