import 'dart:isolate';
import 'dart:io';
import 'package:path/path.dart' as p;

final script = """
void main(List<String> args) {
  print("hello world");
}
""";

void main(List<String> arguments) {
  final path = ".build/script.dart";
  final uri = Uri.file(p.absolute(path));
  final entrypoint = File.fromUri(uri)
    ..createSync(recursive: true)
    ..writeAsStringSync(script);

  final isolate = Isolate.spawnUri(uri, [], null);
}
