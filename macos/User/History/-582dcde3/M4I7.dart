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
  final path = ".build/script.dart";
  final packagePath = ".build/.packages";
  final uri = Uri.file(p.absolute(path));

  print("build uri: $uri");

  File.fromUri(uri)
    ..createSync(recursive: true)
    ..writeAsStringSync(script);
  final exitPort = ReceivePort();
  await Isolate.spawnUri(uri, [], null, onExit: exitPort.sendPort);
  await exitPort.first;
}
