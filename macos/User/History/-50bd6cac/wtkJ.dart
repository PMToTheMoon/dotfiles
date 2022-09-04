import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

class Bloc extends Seed {
  final List<EventHandler> handlers;

  @override
  MetaObject build() {
    return Library(
      name: 'library',
      children: [
        Class(name: 'Bloc', children: [
          Constructor(),
          Method(),
          Member(),
        ]),
      ],
    );
  }
}

void main(List<String> arguments) {
  print('Hello world: ${bonemeal.calculate()}!');
}
