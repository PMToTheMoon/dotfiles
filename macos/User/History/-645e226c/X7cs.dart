const fromJsonImport = r'''
factory {{ class }}.fromJson(Map<String, dynamic> json) => _${{ class }}FromJson(json);
''';

const fromJson = r'''
factory {{ class }}.fromJson(Map<String, dynamic> json) => _${{ class }}FromJson(json);
''';

const constructor = r'''
const factory {{ class }}.{{ constructor.name }}({{ constructor.fields }}) = {{ constructor.class }};
''';

const classBody = r'''
@freezed
class {{ class }} with _${{ class }} {
  const {{ class }}._();

  {{ constructors }}

  {{ fromJson }}
}
''';
