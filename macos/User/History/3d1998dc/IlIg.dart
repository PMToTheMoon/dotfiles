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
    required this.fields,
  });

  // Form.multiSectional({
  //   required this.subject,
  //   required this.sections,
  //   this.spacing,
  // });

  @override
  String get path => '${subject.snakeCase}_form.dart';

  final String subject;
  final List<FormPart> fields;
  final Expression? spacing;

  String get formClassName => '${subject.pascalCase}Form';
  String get controllerClassName => '${formClassName}Controller';
  String get snapshotClassName => '${formClassName}Snapshot';

  @override
  FormMetaData build(BuildStep step) {
    final controllerMeta = _buildController(step);
    _buildWidget(step);

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
  ) async {
    final fieldsMeta = fields.map(
      (field) => step.build(field),
    );
    final formFieldWidgets = fieldsMeta.map((meta) => meta.invokeWidget);
    Iterable<Expression> widgets = formFieldWidgets;
    // if (spacing != null) {
    //   widgets = intersperse(spacing!, sectionsList);
    // }

    final widgetClass = renderTemplate(formWidgetTemplate, step.path, {
      'children': literalList(widgets).accept(step.emitter),
      'class': formClassName,
      'controller': {
        'class': controllerClassName,
      },
    });

    final widgetFileContent = Library((l) => l..body.add(Code(widgetClass)));

    step.emit(widgetFileContent);
  }
}
