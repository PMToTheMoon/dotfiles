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

  FreezedTypeMetaData operator [](String type) => types[type]!;
}

class FreezedTypeMetaData {
  FreezedTypeMetaData({
    required this.$class,
    required this.reference,
  });

  final Reference reference;
  final Class $class;

  String get symbol => $class.name;
  InvokeExpression invoke([Map<String, Expression> parameters = const {}]) =>
      $class.invoke(parameters: parameters);
}

// class Freezed extends MetaObject<UnionMetaData> {
class Freezed extends MetaObject<FreezedMetaData> {
  Freezed({
    required this.className,
    required this.types,
    this.typePrefix,
    this.typeSuffix,
    this.serializable = false,
    this.hooks = const [],
  });

  List<Method> hooks;

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
  String get path => '${className.snakeCase}.dart';

  @override
  // Future<UnionMetaData> build(BuildStep step) async {
  FreezedMetaData build(BuildStep step) {
    final freezedTypes = types.entries.map(
      (e) => _FreezedType(
        className,
        e.key,
        Fields(e.value),
        typeSuffix,
        typePrefix,
      ),
    );
    final constructors = [
      Constructor((c) => c
        ..name = '_'
        ..constant = true),
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
        ..constructors.addAll(constructors)
        ..methods.addAll(hooks),
    );

    final library = Library(
      (l) => l
        // ..directives.addAll([
        //   Directive.part(freezedFileName),
        //   if (serializable) Directive.part(jsonSerializableFileName),
        // ])
        ..body.add(freezedClass),
    );

    final url = step.emit(library);

    return FreezedMetaData(
      $class: freezedClass,
      reference: refer(className, url),
      types: {
        for (final f in freezedTypes) f.name ?? 'new': f.metaData(url),
      },
    );
  }
}

class _FreezedType {
  _FreezedType(
    this.freezedClassName,
    this.name,
    this.fields,
    this.suffix,
    this.prefix,
  ) : redirectConstructorName = name != null
            ? '${prefix ?? ''}${name.pascalCase}${suffix ?? ''}'
            : '_$freezedClassName';

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

  FreezedTypeMetaData metaData(String url) {
    return FreezedTypeMetaData(
      $class: $class,
      reference: refer(
        redirectConstructorName,
        url,
      ),
    );
  }
}
