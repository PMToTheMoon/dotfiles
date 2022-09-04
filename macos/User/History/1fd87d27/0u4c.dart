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
    required this.subject,
    required List<FormField> fields,
    this.snapshotGeneratorFactory = Model.new,
    super.root,
  }) : sections = [
          SpreadFormSection(spacing: refer('widget.spacing'), fields: fields)
        ];

  Form.multiSectional({
    required this.subject,
    required this.sections,
    this.snapshotGeneratorFactory = Model.new,
    super.root,
  });

  final String subject;
  final List<FormSection> sections;
  final ModelGeneratorFactory snapshotGeneratorFactory;

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
      partOf: PartOf.from(AssetId.output(formFileName)),
      fields: Fields({
        ...fields.map((f) => f.toField()),
      }),
    );
    return step.build(generator);
  }

  Future<void> _buildController(
    BuildStep step,
    List<FormFieldMetaData> fieldsMetaData,
    Class snapshot,
  ) async {
    final initializer = fieldsMetaData.map(
      (f) => f.invokeController.assign(refer(f.name)).code,
    );

    final fields = Fields({
      ...fieldsMetaData.map((f) => f.type.toField(f.name)),
    });

    final validateMethod = Method((m) => m
      ..name = 'validate'
      ..returns = refer('bool')
      ..lambda = true
      ..body = const Code('_formKey.currentState!.validate();'));

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
        ..fields.addAll(fields)
        ..methods.addAll([
          validateMethod,
          snapshotMethod,
        ]),
    );

    final controllerFileContent = Library(($) => $
      ..body.addAll(
        [controller],
      )).accept(step.emitter).toString();

    await step.writeOutput(
      controllerFileName,
      controllerFileContent,
      Dependencies([
        PartOf.from(AssetId.output(formFileName)),
      ]),
    );
  }

  Future<void> _buildWidget(
    BuildStep context,
    List<FormSectionMetaData> sections,
  ) async {
    final widgetDeps = Dependencies([
      const CustomDependency("import 'package:flutter/material.dart';"),
      ...?dependencies,
      Part(output: AssetId.output(snapshotFileName)),
      Part(output: AssetId.output(controllerFileName)),
    ]);

    final sectionsList = literalList(
      intersperse(
        refer('widget.spacing'),
        sections.map((s) => s.invokeWidget),
      ),
    );

    final widget = renderDartTemplate(formWidgetTemplate, context.uri, {
      'sections': sectionsList.code,
      'class': formClassName,
      'controller': {
        'class': controllerClassName,
      },
    });
    await context.writeOutput(
      formFileName,
      widget,
      widgetDeps,
    );
  }
}
