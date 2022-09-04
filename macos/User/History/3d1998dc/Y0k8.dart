import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:form_generator/src/form_sections/form_section.dart';
import 'package:form_generator/src/form_sections/sections/spread_section.dart';
import 'package:intersperse/intersperse.dart';
import 'package:model_generators/model_generators.dart';

import 'package:form_generator/src/form_fields/form_field.dart';

part 'form_meta_data.dart';
part 'form_template.dart';

class Form extends MetaObject<FormMetaData> {
  Form({
    required this.subject,
    this.spacing,
    required List<FormField> fields,
  }) : sections = [
          SpreadFormSection(spacing: refer('widget.spacing'), fields: fields)
        ];

  Form.multiSectional({
    required this.subject,
    required this.sections,
    this.spacing,
  });

  @override
  String get path => '${subject.snakeCase}_form.dart';

  final String subject;
  final List<FormField> fields;
  final Expression? spacing;

  String get formClassName => '${subject.pascalCase}Form';
  String get controllerClassName => '${formClassName}Controller';
  String get snapshotClassName => '${formClassName}Snapshot';

  @override
  FormMetaData build(BuildStep step) {
    final sectionsMetaData = sections.map((section) => step.build(section));

    final fieldsMetaData = sectionsMetaData
        .map((meta) => meta.fields)
        .expand((fields) => fields)
        .toList();
    final snapshotMetaData = _buildSnapshot(step, fieldsMetaData);
    _buildController(
      step,
      fieldsMetaData,
      snapshotMetaData.model,
    );
    _buildWidget(step, sectionsMetaData);

    return FormMetaData();
  }

  FormControllerMetaData _buildController(
    BuildStep step,
  ) {
    final controllerFields = fields.map(FormControllerField.fromFormField);

    final controller = FormController(
      formName: formClassName,
      fields: controllerFields,
    );

    return step.buildPart(controller);
  }

  Future<void> _buildWidget(
    BuildStep step,
    List<FormSectionMetaData> sections,
  ) async {
    Iterable<Expression> sectionsList = sections.map((s) => s.invokeWidget);

    if (spacing != null) {
      sectionsList = intersperse(spacing!, sectionsList);
    }

    final widgetClass = renderDartTemplate(formWidgetTemplate, step.uri, {
      'sections': literalList(sectionsList).accept(step.emitter),
      'class': formClassName,
      'controller': {
        'class': controllerClassName,
      },
    });

    final widgetFileContent = Library((l) => l
      ..directives.addAll([
        Directive.part(controllerFileName),
        Directive.part(snapshotFileName)
      ])
      ..body.add(Code(widgetClass))).accept(step.emitter).toString();

    await step.writeAndFormat(
      formFileName,
      widgetFileContent,
    );
  }
}
