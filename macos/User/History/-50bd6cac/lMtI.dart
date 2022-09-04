import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

class Bloc extends Seed {
  final List<EventHandler> handlers;

  @override
  MetaObject build() {
    return MultiPartLibrary(name: "bloc", specs: [
      Class(
        name: 'Bloc',
        children: [
          Constructor(),
          Method(),
          Member(),
        ],
      ),
    ], parts: [
      Library(name: states),
      Library(name: events),
    ]);
  }
}

void main(List<String> arguments) {
  print('Hello world: ${bonemeal.calculate()}!');
}
