import 'dart:async';
import 'dart:html';
import 'dart:isolate';
import 'dart:io';

final script = """
void main(List<String> args) {
  print("hello world");
}
""";

void main(List<String> arguments) {

  final script = File("a");

  final isolate = Isolate.spawnUri(Uri.file(""), args, message)
}
