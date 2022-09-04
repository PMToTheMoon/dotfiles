import 'dart:isolate';
import 'dart:io';
import 'package:path/path.dart' as p;

final script = """
void main(List<String> args) {
  print("hello world");
}
""";

Future main(List<String> arguments) async {
  final path = ".build/script.dart";
  final uri = Uri.file(p.absolute(path));
  final entrypoint = File.fromUri(uri)
    ..createSync(recursive: true)
    ..writeAsStringSync(script);
  final exitPort = ReceivePort();
  await Isolate.spawnUri(uri, [], null, onExit: exitPort.sendPort);
  await exitPort.first;
}
