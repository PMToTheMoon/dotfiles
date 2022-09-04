import 'dart:io';
import 'package:dog/dog.dart';

Future<void> main(List<String> arguments) async {
  dog.i("message");
  dog.v("message");
  dog.w("message");

  final file = File('../api.yaml');
  if (!await file.exists()) {
    return;
  }
  // final data = loadYaml(await file.readAsString()).toMapS();
}
