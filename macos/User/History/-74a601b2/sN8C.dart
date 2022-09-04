import 'dart:io';
import 'package:logger/logger.dart';

void main(List<String> arguments) {
  final d = Logger();
  d.d("aa");
  print("yeyeu");

  // final file = File('../api.yaml');
  // if (!await file.exists()) {
  //   return;
  // }
  // final data = loadYaml(await file.readAsString()).toMapS();
}
