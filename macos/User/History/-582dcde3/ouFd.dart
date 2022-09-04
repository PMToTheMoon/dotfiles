import 'dart:isolate';
import 'dart:io';
import 'package:path/path.dart' as p;

final script = """
import 'package:isolate_res/isolate_res.dart';

void main(List<String> args) {
  sayHello();
}
""";

Future main(List<String> arguments) async {
  final scriptPath = "test_build/test_build.dart";
  final scriptUri = Uri.file(p.absolute(scriptPath));

  print("build uri: $scriptUri");

  File.fromUri(scriptUri)
    ..createSync(recursive: true)
    ..writeAsStringSync(script);

  final exitPort = ReceivePort();
  await Isolate.spawnUri(
    scriptUri,
    [],
    null,
    onExit: exitPort.sendPort,
    packageConfig: p.toUri(p.absolute(".packages")),
  );
  await exitPort.first;
}
