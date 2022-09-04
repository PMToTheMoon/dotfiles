import 'package:flutter/material.dart';

import 'package:neat/neat.dart';
import 'dimensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neat Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: context.subtitle1("neat"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.headline1("Neat"),
              Container(
                padding: const PaddingSmall.all(),
                color: Colors.redAccent,
                child: Container(
                  color: Colors.amber,
                  height: 20,
                  width: 20,
                ),
              ),
              Container(
                padding: const PaddingSmall.horizontal(),
                color: Colors.greenAccent,
                child: Container(
                  color: Colors.green,
                  height: 20,
                  width: 20,
                ),
              ),
              Container(
                padding: const PaddingSmall.vertical(),
                color: Colors.redAccent,
                child: Container(
                  color: Colors.amber,
                  height: 20,
                  width: 20,
                ),
              ),
              Container(
                padding: const PaddingSmall.symmetric(horizontal: true),
                color: Colors.greenAccent,
                child: Container(
                  color: Colors.green,
                  height: 20,
                  width: 20,
                ),
              ),
              Container(
                padding: const PaddingSmall.symmetric(vertical: true),
                color: Colors.redAccent,
                child: Container(
                  color: Colors.amber,
                  height: 20,
                  width: 20,
                ),
              ),
              const SpaceSmall(),
              Container(
                padding: const PaddingSmall(top),
                color: Colors.blue,
                child: Container(
                  color: Colors.lightGreen,
                  height: 20,
                  width: 20,
                ),
              ),
              const SpaceSmall(),
              Container(
                padding: const PaddingSmall(left),
                color: Colors.blue,
                child: Container(
                  color: Colors.lightGreen,
                  height: 20,
                  width: 20,
                ),
              ),
              const SpaceSmall(),
              Container(
                padding: const PaddingSmall(right),
                color: Colors.blue,
                child: Container(
                  color: Colors.lightGreen,
                  height: 20,
                  width: 20,
                ),
              ),
              const SpaceSmall(),
              Container(
                padding: const PaddingSmall(bottom),
                color: Colors.blue,
                child: Container(
                  color: Colors.lightGreen,
                  height: 20,
                  width: 20,
                ),
              ),
              const SpaceSmall(),
              Container(
                padding: const PaddingSmall.only(
                  top: true,
                  left: true,
                  right: true,
                  bottom: true,
                ),
                color: Colors.lightGreenAccent,
                child: Container(
                  color: Colors.lightBlueAccent,
                  height: 20,
                  width: 20,
                ),
              ),
              const SpaceSmall(),
              Container(
                padding: const PaddingSmall.only(
                  top: false,
                  left: false,
                  right: false,
                  bottom: false,
                ),
                color: Colors.lightGreenAccent,
                child: Container(
                  color: Colors.lightBlueAccent,
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
