import 'dart:isolate';
import 'dart:io';

final script = """
void main(List<String> args) {
  print("hello world");
}
""";

void main(List<String> arguments) {

  final entrypoint = File(".build/script.dart")..createSync(recursive: true)..writeAsStringSync(script);

  final isolate = Isolate.spawnUri(Uri.file(""), args, message)
}
