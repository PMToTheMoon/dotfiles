import 'package:bonemeal/bonemeal.dart';
import 'package:source_gen/source_gen.dart';

bool isEntryPoint = false;
final _entrypointTypeChecker = TypeChecker.fromRuntime(Entrypoint);
