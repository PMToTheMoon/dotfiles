import 'dart:isolate';
import 'dart:io';
import 'package:path/path.dart' as p;

final script = """
void main(List<String> args) {
  print("hello world");
}
""";

final packages = """
isolate_res:
  path: "/Users/pm/Project/isolate_test/isolate_res"
""";

Future main(List<String> arguments) async {
  final scriptPath = ".build/script.dart";
  final scriptUri = Uri.file(p.absolute(scriptPath));

  final packagePath = ".build/pubspec.yaml";
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
