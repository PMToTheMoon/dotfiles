import 'package:bonemeal/bonemeal.dart';

class Bloc extends Seed {
  @override
  MetaObject build() {
    return Library(
      name: 'library',
      children: [
        Class(),
      ],
    );
  }
}

void main(List<String> arguments) {
  print('Hello world: ${bonemeal.calculate()}!');
}
