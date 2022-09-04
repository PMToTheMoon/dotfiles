import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

class FormSectionMetaData {
  FormSectionMetaData({
    required this.fields,
    required this.instantiate,
  });
  final List<FormFieldMetaData> fields;
  final String instantiate;
}

abstract class FormSection extends MetaObject<FormSectionMetaData> {
  FormSection({
    required this.spacing,
    required this.fields,
  });

  final String spacing;
  final List<FormField> fields;
}
