const constructor = r'''
const factory {{ class }}.{{ constructor.name }}({{ constructor.fields }}) = {{ constructor.class }};
''';

const classBody = r'''
@freezed
class {{ class }} with _${{ class }} {
  const {{ class }}._();

  {{ constructors }}
}
''';
