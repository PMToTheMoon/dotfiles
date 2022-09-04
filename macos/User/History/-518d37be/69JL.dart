import 'package:bonemeal/bonemeal.dart';

// part 'union_meta_data.dart';

class FreezedMetaData {
  FreezedMetaData({
    required this.$class,
    required this.reference,
    required this.types,
  });

  final Class $class;
  final Reference reference;
  final Map<String, FreezedTypeMetaData> types;
}

class FreezedTypeMetaData {
  FreezedTypeMetaData({
    required this.$class,
    required this.reference,
  });

  final Reference reference;
  final Class $class;
}

// class Freezed extends MetaObject<UnionMetaData> {
class Freezed extends MetaObject<FreezedMetaData> {
  Freezed({
    required this.className,
    required this.types,
    this.typePrefix,
    this.typeSuffix,
    this.serializable = false,
  });

  final String className;

  /// Append prefix at the begin of all types name
  /// /// Does nor apply to unnamed constructors
  final String? typePrefix;

  /// Append suffix at the end of all types name
  /// Does nor apply to unnamed constructors
  final String? typeSuffix;

  final Map<String, Set<Field>> types;
  final bool serializable;

  @override
  // Future<UnionMetaData> build(BuildStep step) async {
  FreezedMetaData build(BuildStep step) {
    final filePrefix = className.snakeCase;
    final file = '$filePrefix.dart';
    final freezedFileName = '$filePrefix.freezed.dart';
    final jsonSerializableFileName = '$filePrefix.g.dart';

    final freezedTypes = types.entries.map(
      (e) => _FreezedType(
        fileUrl,
        className,
        e.key,
        Fields(e.value),
        typeSuffix,
        typePrefix,
      ),
    );
    final constructors = [
      for (final t in freezedTypes) t.constructor,
      if (serializable)
        Constructor(
          (c) => c
            ..factory = true
            ..name = 'fromJson'
            ..requiredParameters.add(
              Parameter(
                (p) => p
                  ..type = refer('Map<String, dynamic>')
                  ..name = 'json',
              ),
            )
            ..lambda = true
            ..body = refer('_\$${className}FromJson(json)', 'gen:.g.dart').code,
        ),
    ];

    final freezedClass = Class(
      (c) => c
        ..annotations.add(refer(
          'freezed',
          'package:freezed_annotation/freezed_annotation.dart',
        ))
        ..name = className
        ..mixins.add(refer('_\$$className', 'gen:.freezed.dart'))
        ..constructors.addAll(constructors),
    );

    final library = Library(
      (l) => l
        // ..directives.addAll([
        //   Directive.part(freezedFileName),
        //   if (serializable) Directive.part(jsonSerializableFileName),
        // ])
        ..body.add(freezedClass),
    );

    final url = step.emit(file, library);

    return FreezedMetaData(
      $class: freezedClass,
      reference: refer(className, fileUrl),
      types: {
        for (final f in freezedTypes) f.name ?? 'new': f.metaData,
      },
    );
  }
}

class _FreezedType {
  _FreezedType(
    this.freezedFileUrl,
    this.freezedClassName,
    this.name,
    this.fields,
    this.suffix,
    this.prefix,
  ) : redirectConstructorName = name != null
            ? '${prefix ?? ''}${name.pascalCase}${suffix ?? ''}'
            : '_$freezedClassName';

  final String freezedFileUrl;
  final String freezedClassName;
  final String? name;
  final Fields fields;
  final String? suffix;
  final String? prefix;
  final String redirectConstructorName;

  Constructor get constructor {
    return Constructor(
      (c) => c
        ..name = name
        ..optionalParameters.addAll(
            fields.toNamedParameters(toThis: false, removeAnnotations: false))
        ..constant = true
        ..factory = true
        ..redirect = refer(redirectConstructorName),
    );
  }

  Class get $class {
    final ctr = constructor.rebuild((c) => c..name = null);
    return Class(
      ($) => $
        ..name = name == null ? freezedClassName : redirectConstructorName
        ..constructors.add(ctr)
        ..fields.addAll(fields),
    );
  }

  FreezedTypeMetaData get metaData {
    return FreezedTypeMetaData(
      $class: $class,
      reference: refer(
        redirectConstructorName,
        freezedFileUrl,
      ),
    );
  }
}
