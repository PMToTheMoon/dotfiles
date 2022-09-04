import 'package:code_builder/code_builder.dart';
import 'package:bonemeal/bonemeal.dart';

final emitter = DartEmitter(useNullSafetySyntax: true, allocator: Allocator());

void main() {
  final root = Library((l) => l
    ..body.add(
      refer('Tada', 'tada.dart').call([]).assignFinal('test'),
    ));

  print(root.accept(emitter));
}
