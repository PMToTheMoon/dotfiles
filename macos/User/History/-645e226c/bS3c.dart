part of 'freezed.dart';

const fromJsonHeaderTemplate = r"""
part '{{ file }}.g.dart';
""";

const fromJsonFactoryTemplate = r'''
factory {{ class }}.fromJson(Map<String, dynamic> json) => _${{ class }}FromJson(json);
''';

const constructorTemplate = r'''
const factory {{ class }}.{{ constructor.name }}({
  {{ constructor.fields }}
}) = {{ constructor.class }};
''';

const modelTemplate = r'''
{{ json.header }}

@freezed
class {{ class }} with _${{ class }} {
  const {{ class }}._();

  {{ constructors }}

  {{ json.factory }}
}
''';
