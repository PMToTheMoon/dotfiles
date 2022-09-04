// import 'package:bonemeal/bonemeal.dart';
// import 'package:form_generator/src/form_fields/form_field.dart';

// class FormSectionMetaData {
//   const FormSectionMetaData({
//     required this.fields,
//     required this.invokeWidget,
//   });
//   final List<FormFieldMetaData> fields;
//   final Expression invokeWidget;
// }

import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

abstract class FormSection extends FormPart {
  FormSection({
    required this.fields,
  });

  final List<FormField> fields;
}
