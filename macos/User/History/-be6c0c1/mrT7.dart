import 'package:bloc/bloc.dart';

class BuildContext {}

class Output {}

abstract class MetaObject {
  void write(BuildStep step) {}
}
