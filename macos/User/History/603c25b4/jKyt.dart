import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';
import 'package:form_generator/form_generator.dart';
import 'package:form_generator/src/form_sections/form_section.dart';

const wrappedSectionTemplate = '''
{{ wrapper.class }}(
  {{ wrapper.params }},
  children: [
    {{ fields }}
  ],
)''';

typedef Wrapper = InvokeExpression Function(List<FormFieldMetaData> fields);

class WrappedFormSection extends FormSection {
  const WrappedFormSection({
    required this.wrapper,
    required super.spacing,
    required super.fields,
  });

  final Wrapper wrapper;

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    final fieldsMetaData = await Future.wait(
      fields.map((f) async => f.build(step)),
    );

    final widget = wrapper(fieldsMetaData);
    return FormSectionMetaData(
      fields: fieldsMetaData,
      widget: widget,
    );
  }
}
