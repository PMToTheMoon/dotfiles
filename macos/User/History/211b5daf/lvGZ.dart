import 'package:bloc_generators/src/repository/repository_item.dart';
import 'package:bloc_generators/src/repository/repository_source.dart';
import 'package:bonemeal/bonemeal.dart';

export 'repository_item.dart';
export 'repository_source.dart';

class RepositoryMetaData {
  RepositoryMetaData({
    required this.reference,
    required this.$class,
    required this.sources,
  });
  final Reference reference;
  final Class $class;
  final Map<String, RepositorySource> sources;
}

class Repository extends MetaObject<RepositoryMetaData> {
  Repository({
    required this.constructor,
    required this.subject,
    required this.items,
    this.fields = const [],
    this.methods = const [],
  });

  final Constructor constructor;
  final String subject;
  final Iterable<RepositoryItem> items;
  final Iterable<Field> fields;
  final List<Method> methods;

  @override
  String get path => '${subject.snakeCase}_repository.dart';

  @override
  RepositoryMetaData build(BuildStep step) {
    final allFields = [
      ...fields,
      ...items.expand((i) => i.fields),
    ];

    final allMethods = [
      ...methods,
      ...items.expand((i) => i.methods),
    ];

    final repository = Class(
      (c) => c
        ..name = '${subject.pascalCase}Repository'
        ..constructors.add(constructor)
        ..fields.addAll(allFields)
        ..methods.addAll(allMethods),
    );

    final library = Library(
      (l) => l..body.add(repository),
    );
    final libraryUrl = step.emit(library);
    final repositoryReference = refer(repository.name, libraryUrl);
    final sourcesMeta = _buildSourcesMeta(repositoryReference);

    return RepositoryMetaData(
      reference: repositoryReference,
      $class: repository,
      sources: sourcesMeta,
    );
  }

  Map<String, RepositorySource> _buildSourcesMeta(Reference repository) {
    final sources = <MapEntry<String, RepositorySource>>[];
    for (final item in items) {
      final meta = item.meta(repository);
      assert(() {
        if (meta.method.returns == refer('void')) {
          throw 'Method that retuen vois are forbidden for repository sources';
        }
        return true;
      }());
      sources.add(MapEntry(
        item.name,
      ));
    }
    return Map.fromEntries(sources);
  }
}
