import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

class FormSectionMetaData {
  FormSectionMetaData({
    required this.instentiate,
  });
  final String instentiate;
}

class FormSection extends MetaObject<FormSectionMetaData> {
  FormSection({
    required this.spacing,
    required this.fields,
  });

  final String spacing;
  final List<FormField> fields;

  @override
  FormSectionMetaData build(BuildStep context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
