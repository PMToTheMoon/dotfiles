import 'dart:io';

/// Remove all files from dir that match a file inside source
Future<void> subtractSourceToTargetDir(String source, String dir) async {
  final sourceDir = Directory(source);
  if (await sourceDir.exists() == false) return;
}
