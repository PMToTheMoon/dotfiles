import 'package:bonemeal/bonemeal.dart' as bonemeal;
import 'package:bonemeal/src/fundations/dart.dart';
import 'package:bonemeal/src/fundations/framework.dart';

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
