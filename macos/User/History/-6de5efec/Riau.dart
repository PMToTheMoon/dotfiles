import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

class FormSectionMetaData {}

class FormSection extends MetaObject<FormSectionMetaData> {
  final List<FormField> fields;
}
