import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_sections/form_section.dart';

const wrappedSectionTemplate = '''
{{ wrapper.class }}(
  {{ wrapper.params }},
  children: [
    {{ fields }}
  ],
)''';

class WrappedFormSection extends FormSection {
  const WrappedFormSection({
    required this.wrapper,
    required this.widgetParams,
    required super.spacing,
    required super.fields,
  });

  final Reference wrapper;
  final List<Expression> positionalArguments;
  final List<Expression> optionalArguments;

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    final fieldsMetaData = await Future.wait(
      fields.map((f) async => f.build(step)),
    );
    final section = renderTemplate(wrappedSectionTemplate, step.uri, {
      'wrapper': {
        'class': widgetClass,
        'params': widgetParams,
      },
      'fields':
          fieldsMetaData.map((m) => m.widgetDeclaration).join(',$spacing,'),
    });
    final wigdet = InvokeExpression.newOf(wrapper, positionalArguments, [
      ...positionalArguments,
    ]);
    return FormSectionMetaData(
      fields: fieldsMetaData,
      widget: section,
    );
  }
}
