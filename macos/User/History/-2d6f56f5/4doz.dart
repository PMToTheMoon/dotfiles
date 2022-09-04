import 'package:common/common.dart';

@FormFieldDeclartion({
  'hint': String,
  'validator': String? Function(String?)
})
const dec = r"""
MultiLineTextFormField(
  controller: {{ controller }},
  hint: {{ hint }},
  validator: {{ validator }},
  decorations: {{ decorations }},
)""";
