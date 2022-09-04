import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_section/form_section.dart';

const wrappedSectionTemplate = '''
{{ wrapper.class }}(
  {{ wrapper.params }},
  fields: [
    {{ fields }}
  ],
)''';

class WrappedSection extends FormSection {
  WrappedSection({
    required this.widgetClass,
    required this.widgetParams,
    required super.spacing,
    required super.fields,
  });

  final widgetClass;
  final widgetParams;

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    final fieldsMetaData = await Future.wait(
      fields.map((f) async => f.build(step)),
    );
    final section = renderDartTemplate(wrappedSectionTemplate, step.uri, {
      'wrapper': {
        'class': widgetClass,
        'params': widgetParams,
      },
      'fields': fieldsMetaData
          .map((m) => m.widgetDeclaration)
          .join(',SizedBox(height: widget.spacing),'),
    });
    return FormSectionMetaData(
      instantiate: section,
    );
  }
}
