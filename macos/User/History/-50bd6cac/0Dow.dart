import 'package:bonemeal/bonemeal.dart' as bonemeal;
import 'package:bonemeal/src/foundations/dart.dart';
import 'package:bonemeal/src/foundations/framework.dart';

class Bloc extends Seed {
  @override
  MetaObject build() {
    return Library(name: 'library', children: [
      Class(),
    ]);
  }
}

void main(List<String> arguments) {
  print('Hello world: ${bonemeal.calculate()}!');
}
