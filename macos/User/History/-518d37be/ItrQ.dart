import 'package:bonemeal/bonemeal.dart';
import 'package:quiver/strings.dart';

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

  FreezedTypeMetaData operator [](String type) {
    final t = types[type];
    if (t == null) {
      throw 'Trying to access a type from ${$class.name} that does not exist: $type. Available types: ${types.keys}';
    }
    return t;
  }
}

class FreezedTypeMetaData {
  FreezedTypeMetaData({
    required this.name,
    required this.$class,
    required this.reference,
  });

  final String name;
  final Reference reference;
  final Class $class;

  String get symbol => $class.name;
  InvokeExpression invoke({ValueResolver? values}) =>
      $class.invoke(values: values);
}

// class Freezed extends MetaObject<UnionMetaData> {
class Freezed extends MetaObject<FreezedMetaData> {
  Freezed({
    required this.className,
    required this.types,
    this.typePrefix,
    this.typeSuffix,
    this.serializable = false,
    this.methods = const [],
  });

  List<Method> methods;

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
        freezedClassName: className,
        name: e.key,
        suffix: typeSuffix,
        prefix: typePrefix,
        fields: Fields(e.value),
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
  _FreezedType({
    required this.freezedClassName,
    required this.fields,
    required this.name,
    required this.suffix,
    required this.prefix,
  }) : redirectConstructorName = name != null
            ? '${prefix?.pascalCase ?? ''}${name.pascalCase}${suffix?.pascalCase ?? ''}'
            : '_$freezedClassName';

  final String freezedClassName;
  final String? name;
  final Fields fields;
  final String? suffix;
  final String? prefix;
  final String redirectConstructorName;

  String? get effectiveConstructorName => isBlank(name) ? null : name;

  String get effectiveConstructorRedirection {
    String redirection =
        isBlank(name) ? '_$freezedClassName' : redirectConstructorName;
    return redirection;
  }

  Constructor get constructor {
    return Constructor(
      (c) => c
        ..name = effectiveConstructorName
        ..optionalParameters.addAll(
            fields.toNamedParameters(toThis: false, removeAnnotations: false))
        ..constant = true
        ..factory = true
        ..redirect = refer(effectiveConstructorRedirection),
    );
  }

  Class get $class {
    final ctr = constructor.rebuild((c) => c..name = null);
    return Class(
      ($) => $
        ..name = effectiveConstructorRedirection
        ..constructors.add(ctr)
        ..fields.addAll(fields),
    );
  }

  FreezedTypeMetaData metaData(String url) {
    return FreezedTypeMetaData(
      name: name ?? '',
      $class: $class,
      reference: refer(
        redirectConstructorName,
        url,
      ),
    );
  }
}
