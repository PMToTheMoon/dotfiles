import 'package:mason/mason.dart';
import 'package:ftool/ftool.dart';
import 'dart:io';

Future<void> run(HookContext context) async {
  context.logger.info('api post-gen hook started');

  final file = File('{{input}}');
  if (!await file.exists()) {
    context.logger.err("API: input file not found");
  }
}
