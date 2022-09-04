part of 'freezed.dart';

class FreezedData {
  FreezedData({
    required this.type,
    required this.radical,
    required this.types,
    this.serializable = false,
    this.partOf,
  });

  final String type;
  final String radical;
  final List<FreezedType> types;
  final PartOf? partOf;
  final bool serializable;
}


class FreezedType {
  const FreezedType(this.constructor, [this.fields = const {}]);
  final String constructor;
  final Map<String, String> fields;

  Map<String, String> toParams(String radical) => {
        'name': constructor,
        'class': '$radical${constructor.pascalCase}',
        'fields': fields.entries.isNotEmpty
            ? [
                '({',
                fields.entries
                    .map((e) => 'required ${e.value} ${e.key},')
                    .join(''),
                '})',
              ].join('')
            : '()',
      };

  FreezedTypeMetaData toMetaData(String radical) => FreezedTypeMetaData(
        className: '$radical${constructor.pascalCase}',
        constructor: constructor,
        fields: fields.entries
            .map((e) => FreezedFieldMetaData(type: e.value, name: e.key))
            .toSet(),
      );
}

class FreezedMetaData {
  FreezedMetaData({
    required this.types,
  });
  final String className;
  final List<FreezedTypeMetaData> types;

  Map<String, dynamic> toParams() => {
    'types': 
  }
}

class FreezedTypeMetaData {
  const FreezedTypeMetaData({
    required this.className,
    required this.constructor,
    required this.fields,
  });

  final String className;
  final String constructor;
  final Set<FreezedFieldMetaData> fields;

  Map<String, dynamic> toParams() => {
    'class': className,
    'ctr': {
      'name': constructor,
      'parameters': fields.isNotEmpty
            ? [
                '({',
                fields
                    .map((f) => f.toDeclaration())
                    .join(','),
                '})',
              ].join('')
            : '()',
    },
  }
}

class FreezedFieldMetaData {
  const FreezedFieldMetaData({
    required this.type,
    required this.name,
  });

  final String type;
  final String name;

  String toDeclaration() => 'required $type $name';
}
