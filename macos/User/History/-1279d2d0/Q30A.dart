import 'package:bonemeal/src/dart/dart.dart';
import 'package:bonemeal/src/framework.dart';

class Bloc extends Seed {
  @override
  MetaObject build() {
    return Library(
      name: name,
      children: [
        Class(name),
      ],
    );
  }
}
