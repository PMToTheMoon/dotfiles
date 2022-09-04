import 'dart:io';

Future<void> main(List<String> arguments) async {
  final file = File('../api.yaml');
  if (!await file.exists()) {
    return;
  }
  final data = loadYaml(await file.readAsString()).toMapS();
}
