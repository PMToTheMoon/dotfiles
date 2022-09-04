import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_sections/form_section.dart';
import 'package:form_generator/src/form_sections/sections/spread_section.dart';
import 'package:intersperse/intersperse.dart';
import 'package:model_generators/model_generators.dart';

import 'package:form_generator/src/form_fields/form_field.dart';

part 'form_meta_data.dart';
part 'form_template.dart';

class Form extends MetaObject<FormMetaData> {
  Form({
    super.root,
    required this.subject,
    this.snapshotGeneratorFactory = Model.new,
    this.spacing,
    required List<FormField> fields,
  }) : sections = [
          SpreadFormSection(spacing: refer('widget.spacing'), fields: fields)
        ];

  Form.multiSectional({
    required this.subject,
    required this.sections,
    this.spacing,
    this.snapshotGeneratorFactory = Model.new,
    super.root,
  });

  final String subject;
  final List<FormSection> sections;
  final ModelGeneratorFactory snapshotGeneratorFactory;
  final Expression? spacing;

  String get formClassName => '${subject.pascalCase}Form';
  String get formFileName => '${subject.snakeCase}_form.dart';

  String get snapshotClassName => '${formClassName}Snapshot';
  String get snapshotFileName => '${subject.snakeCase}_form_snapshot.dart';

  String get controllerClassName => '${formClassName}Controller';
  String get controllerFileName => '${subject.snakeCase}_form_controller.dart';

  @override
  Future<FormMetaData> build(BuildStep step) async {
    final sectionsMetaData = await Future.wait(
      sections.map((s) async => s.build(step)),
    );
    final fieldsMetaData =
        sectionsMetaData.map((s) => s.fields).expand((l) => l).toList();
    final snapshotMetaData = await _buildSnapshot(step, fieldsMetaData);
    await _buildController(
      step,
      fieldsMetaData,
      snapshotMetaData.model,
    );
    await _buildWidget(step, sectionsMetaData);

    return FormMetaData();
  }

  Future<ModelMetaData> _buildSnapshot(
    BuildStep step,
    List<FormFieldMetaData> fields,
  ) async {
    final generator = snapshotGeneratorFactory(
      className: snapshotClassName,
      fields: Fields({
        ...fields.map((f) => f.toField()),
      }),
    );
    return step.build(generator, partOf: formFileName);
  }

  Future<void> _buildController(
    BuildStep step,
    List<FormFieldMetaData> fieldsMetaData,
    Class snapshot,
  ) async {
    final initializer = fieldsMetaData.map(
      (f) => refer(f.name).assign(f.invokeController).code,
    );

    final fields = Fields({
      ...fieldsMetaData.map((f) => f.controller.toField(f.name)),
    });

    final validateMethod = Method((m) => m
      ..name = 'validate'
      ..returns = refer('bool')
      ..lambda = true
      ..body = const Code('_formKey.currentState!.validate()'));

    final snapshotMethod = Method((m) => m
      ..name = 'snapshot'
      ..returns = refer(snapshot.name)
      ..lambda = true
      ..body = InvokeExpression.newOf(
        refer(snapshot.name),
        [],
        {for (final f in fieldsMetaData) f.name: f.getValue},
      ).code);

    final controller = Class(
      ($) => $
        ..name = controllerClassName
        ..constructors.add(
          Constructor((c) => c
            ..optionalParameters.add(
              Parameter((p) => p
                ..name = 'initialValue'
                ..type = refer('$snapshotClassName?')
                ..named = true),
            )
            ..initializers.addAll(initializer)),
        )
        ..fields.add(Field((f) => f
          ..name = '_formKey'
          ..modifier = FieldModifier.final$
          ..assignment = refer('GlobalKey<FormState>').call([]).code))
        ..fields.addAll(fields)
        ..methods.addAll([
          validateMethod,
          snapshotMethod,
        ]),
    );

    final test = DartEmitter(
      useNullSafetySyntax: true,
    );

    final controllerFileContent = Library(($) => $
      ..directives.addAll([
        Directive.partOf(formFileName),
      ])
      ..body.addAll(
        [controller],
      )).accept(test).toString();

    await step.writeAndFormat(
      controllerFileName,
      controllerFileContent,
    );
  }

  Future<void> _buildWidget(
    BuildStep step,
    List<FormSectionMetaData> sections,
  ) async {
    Iterable<Expression> sectionsList =       sections.map((s) => s.invokeWidget);

    final sectionsList = spacing != null ? intersperse(
      spacing,
      sections.map((s) => s.invokeWidget),
    );

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
