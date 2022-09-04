import 'package:code_builder/code_builder.dart';
import 'package:bonemeal/bonemeal.dart';

void main() {
  final other = Library((l) => l
    // ..name = 'a.dart'
    ..directives.add(Directive.part('root.dart'))
    ..body.add(Class((c) => c..name = 'Tada')));

  final root = Library((l) => l
    ..directives.add(Directive.partOf('a.dart'))
    ..body.add(
      refer('Tada', 'tada.dart').call([]).assignFinal('test'),
    ));

  print(other.accept(emitter));
  print(root.accept(emitter));
}
