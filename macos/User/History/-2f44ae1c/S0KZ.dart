part of 'freezed.dart';

const headerTemplate = """
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{ file_prefix }}.freezed.dart';""";

const fromJsonHeaderTemplate = "part '{{ file_prefix }}.g.dart';";

const fromJsonFactoryTemplate = r'''
factory {{ class }}.fromJson(Map<String, dynamic> json) => _${{ class }}FromJson(json);
''';

const constructorTemplate = r'''
const factory {{ class }}.{{ constructor.name }}({{ constructor.fields }}) = {{ constructor.class }};
''';

const modelTemplate = r'''
{{ header }}
{{ json.header }}

@freezed
class {{ union }} with _${{ union }} {
  const {{ union }}._();

  {{# constructors }}
  const factory {{ union }}.{{ constructor }} = {{ class }};

  {{/ constructors }}

  {{ class }}

  {{ json.factory }}
}
''';
