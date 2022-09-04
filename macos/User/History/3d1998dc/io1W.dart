import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:intersperse/intersperse.dart';

part 'form_meta_data.dart';
part 'form_template.dart';

class Form extends MetaObject<FormMetaData> {
  Form({
    required this.subject,
    this.spacing,
    required this.parts,
  });

  @override
  String get path => '${subject.snakeCase}_form.dart';

  final String subject;
  final List<MetaObject<FormPartMetaData>> parts;
  final Expression? spacing;

  String get formClassName => '${subject.pascalCase}Form';
  String get controllerClassName => '${formClassName}Controller';
  String get snapshotClassName => '${formClassName}Snapshot';

  @override
  FormMetaData build(BuildStep step) {
    final partsMeta = parts.map(step.build);
    final controllerMeta = _buildController(step, partsMeta);
    _buildWidget(step, partsMeta);

    return FormMetaData();
  }

  FormControllerMetaData _buildController(
    BuildStep step,
    Iterable<FormPartMetaData> partsMeta,
  ) {
    final controllerFields = partsMeta.expand((meta) => meta.controllerFields);

    final controller = FormController(
      formName: formClassName,
      fields: controllerFields,
    );

    return step.buildPart(controller);
  }

  Future<void> _buildWidget(
    BuildStep step,
    Iterable<FormPartMetaData> fieldsMeta,
  ) async {
    final formFieldWidgets = fieldsMeta.expand(
      (meta) => meta.widgetInvocations(
        refer('_controller'),
      ),
    );
    Iterable<Expression> widgets = formFieldWidgets;
    if (spacing != null) {
      widgets = intersperse(spacing!, widgets);
    }

    final widgetClass = renderTemplate(formWidgetTemplate, step.path, {
      'children': literalList(widgets).accept(step.emitter),
      'class': formClassName,
      'controller': {
        'class': controllerClassName,
      },
    });

    final widgetFileContent = Library(
      (l) => l
        ..body.add(
          Code(widgetClass),
        ),
    );

    step.emit(widgetFileContent);
  }
}
