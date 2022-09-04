part of 'union.dart';

const headerTemplate = """
import 'package:freezed_annotation/freezed_annotation.dart';

{{ json_header }}

part '{{ file_prefix }}.freezed.dart';""";

const fromJsonHeaderTemplate = "part '{{ file_prefix }}.g.dart';";

const fromJsonFactoryTemplate = r'''
factory {{ class }}.fromJson(Map<String, dynamic> json) => _${{ class }}FromJson(json);
''';

const constructorTemplate = r'''
const factory {{ class }}.{{ constructor.name }}({{ constructor.fields }}) = {{ constructor.class }};
''';

const unionTemplate = r'''
{{ json.header }}

@freezed
class {{ union }} with _${{ union }} {
  const {{ union }}._();

  {{# types }}
  const factory {{ union }}.{{ constructor }} = {{ class }};

  {{/ types }}

  {{ json.factory }}
}
''';
