import 'dart:isolate';
import 'dart:io';
import 'package:path/path.dart' as p;

final script = """
void main(List<String> args) {
  print("hello world");
}
""";

final packages = """
name: build_script

dependencies:
  isolate_res:
    path: "/Users/pm/Project/isolate_test/isolate_res"
""";

Future main(List<String> arguments) async {
  final scriptPath = ".build/script.dart";
  final scriptUri = Uri.file(p.absolute(scriptPath));

  final packagePath = ".build/.packages";
  final packagesUro = Uri.file(p.absolute(packagePath));

  print("build uri: $uri");

  File.fromUri(uri)
    ..createSync(recursive: true)
    ..writeAsStringSync(script);

  File.fromUri(uri)
    ..createSync(recursive: true)
    ..writeAsStringSync(script);
  final exitPort = ReceivePort();
  await Isolate.spawnUri(uri, [], null, onExit: exitPort.sendPort);
  await exitPort.first;
}
