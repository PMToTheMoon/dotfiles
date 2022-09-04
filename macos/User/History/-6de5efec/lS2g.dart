import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

class FormSectionMetaData {
  const FormSectionMetaData({
    required this.fields,
    required this.widget,
  });
  final List<FormFieldMetaData> fields;
  final Expression widget;
}

abstract class FormSection extends MetaObject<FormSectionMetaData> {
  const FormSection({
    required this.spacing,
    required this.fields,
  });

  final Expression spacing;
  final List<FormField> fields;
}
