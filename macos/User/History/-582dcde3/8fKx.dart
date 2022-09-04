import 'dart:isolate';
import 'dart:io';
import 'package:path/path.dart' as p;

final script = """
void main(List<String> args) {
  print("hello world");
}
""";

final packages = """
name: test_build

environment:
  sdk: '>=2.10.0 <3.0.0'

dependencies:
  isolate_res:
    path: ../packages/isolate_res
""";

Future main(List<String> arguments) async {
  final scriptPath = "test_build/test_build.dart";
  final scriptUri = Uri.file(p.absolute(scriptPath));

  final packagePath = "test_build/.packages";
  final packageUri = Uri.file(p.absolute(packagePath));

  print("build uri: $scriptUri");
  print("package uri: $packageUri");

  File.fromUri(scriptUri)
    ..createSync(recursive: true)
    ..writeAsStringSync(script);

  File.fromUri(packageUri)
    ..createSync(recursive: true)
    ..writeAsStringSync(packages);
  final exitPort = ReceivePort();
  await Isolate.spawnUri(
    scriptUri,
    [],
    null,
    onExit: exitPort.sendPort,
    packageConfig: packageUri,
  );
  await exitPort.first;
}
