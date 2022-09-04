import 'package:code_builder/code_builder.dart';
import 'package:bonemeal/bonemeal.dart';

final emitter = DartEmitter(useNullSafetySyntax: true, allocator: Allocator());

void main() {
  final other = Library((l) => l
    ..name = 'a.dart'
    ..body.add(
      refer('Tada', 'tada.dart').call([]).assignFinal('test'),
    ));

  final root = Library((l) => l
    ..directives.add(Directive.partOf('a.dart'))
    ..body.add(
      refer('Tada', 'tada.dart').call([]).assignFinal('test'),
    ));

  print(root.accept(emitter));
}
