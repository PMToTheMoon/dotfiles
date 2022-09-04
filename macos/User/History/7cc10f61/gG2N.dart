import 'package:bonemeal/bonemeal.dart';

export 'chip_editor_form_field.dart';
export 'column_section.dart';
export 'multi_line_form_field.dart';
export 'titled_section.dart';
export 'chip_selector_form_field.dart';

final outerSectionSpacing = refer('SpaceSmall').constInstanceNamed('h', []);
final innerSectionSpacing = refer('SpaceSmaller').constInstanceNamed('h', []);
final horizontalSpacing = refer('SpaceSmaller').constInstanceNamed('w', []);

extension ToL10nCall on String {
  Expression get tr => refer('context.l10n.$this');
}

final requiredValidator = refer(
  'FormBuilderValidators.required(errorText: context.l10n.required_error)',
  'package:form_builder_validators/form_builder_validators.dart',
);
