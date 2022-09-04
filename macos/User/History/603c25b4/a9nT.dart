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
  final Iterable<Expression> positionalArguments;
  final String widgetParams;

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    InvokeExpression.constOf(target, positionalArguments)

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
    final wigdet = InvokeExpression.newOf(wrapper, positionalArguments)
    return FormSectionMetaData(
      fields: fieldsMetaData,
      widget: section,
    );
  }
}
