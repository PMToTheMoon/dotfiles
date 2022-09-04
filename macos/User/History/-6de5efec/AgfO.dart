import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

class FormSectionMetaData {}

class FormSection extends MetaObject<FormSectionMetaData> {
  FormSection({
    this.fields,
  });

  final List<FormField> fields;

  @override
  FormSectionMetaData build(BuildStep context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
