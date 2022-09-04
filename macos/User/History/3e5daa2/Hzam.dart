import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_sections/form_section.dart';
import 'package:intersperse/intersperse.dart';

/// A Form Section that spread it widgets into it's parent
class SpreadFormSection extends FormSection {
  const SpreadFormSection({
    required super.spacing,
    required super.fields,
  });

  @override
  Future<FormSectionMetaData> build(BuildStep step) async {
    final fieldsMetaData = await Future.wait(
      fields.map((f) async => f.build(step)),
    );

    final expressions = intersperse(
      spacing,
      fieldsMetaData.map((f) => f.invokeWidget),
    );

    return FormSectionMetaData(
      fields: fieldsMetaData,
      widget: literalList(expressions).spread,
    );
  }
}
