import 'package:bloc_generators/src/repository/repository_source.dart';
import 'package:bonemeal/bonemeal.dart';

export 'repository_source.dart';

class Repository extends MetaObject {
  Repository({
    required this.constructor,
    required this.subject,
    required this.items,
  });

  final Constructor constructor;
  final String subject;
  final Iterable<RepositoryItem> items;
  final Iterable<Field> fields;

  @override
  String get path => '${subject.snakeCase}_repository.dart';

  @override
  void build(BuildStep step) {
    final fields = items.expand((i) => i.fields);

    final methods = items.expand((i) => i.methods);

    final repository = Class(
      (c) => c
        ..name = '${subject.pascalCase}Repository'
        ..constructors.add(constructor)
        ..fields.addAll(fields)
        ..methods.addAll(methods),
    );

    final library = Library(
      (l) => l..body.add(repository),
    );
    step.emit(library);
  }
}
