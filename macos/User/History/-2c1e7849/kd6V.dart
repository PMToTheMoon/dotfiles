import 'dart:async';
import 'dart:collection';

import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';
import 'form_field_controller.dart';

class FormControllerMetaData {
  FormControllerMetaData({
    required this.snapshot,
    required this.controller,
  });

  final ModelMetaData snapshot;
  final Class controller;
}

class FormControllerField {
  FormControllerField(
    this.name, {
    required this.controller,
  });

  final String name;
  final FormFieldController controller;
}

class FormController extends MetaObject<FormControllerMetaData> {
  FormController({
    required this.formName,
    required this.fields,
  });

  final String formName;
  final List<FormControllerField> fields;

  @override
  FutureOr<FormControllerMetaData> build(BuildStep step) async {
    final controllerClassName = '${formName.pascalCase}Controller';
    final snapshotClassName = '${formName.pascalCase}Snapshot';
    final fileName = '${formName.snakeCase}_controller.dart';
    final controllerFields = _buildControllerFields();
    final snapshotFields = _buildSnapshotFields();

    final snapshot = Model(
      className: snapshotClassName,
      fields: snapshotFields,
    );
    final snapshotMetaData = await step.build(snapshot);

    final controller = _buildControllerClass(
      controllerClassName,
      controllerFields: controllerFields,
      snapshotFields: snapshotFields,
      snapshot: snapshotMetaData,
    );

    final library = Library(
      ($) => $
        ..body.addAll([
          // snapshotMetaData.model,
          controller,
        ]),
    );

    await step.emit(fileName, library);

    return FormControllerMetaData(
      snapshot: snapshotMetaData,
      controller: controller,
    );
  }

  Fields _buildControllerFields() {
    return Fields(
      fields.map((f) => f.controller.fieldDeclaration(f.name)).toSet(),
    );
  }

  Fields _buildSnapshotFields() {
    return Fields(
      fields.map((f) => field(f.name, f.controller.valueType)).toSet(),
    );
  }

  Class _buildControllerClass(
    String className, {
    required Fields controllerFields,
    required Fields snapshotFields,
    required ModelMetaData snapshot,
  }) {
    final constructor = Constructor(
      ($) => $
        ..optionalParameters.addAll(
          snapshotFields.toNullable().toNamedParameters(toThis: false),
        )
        ..initializers.addAll(fields.map((f) {
          final ctr = f.controller.invokeController(refer(f.name));
          return refer(f.name).assign(ctr).code;
        })),
    );
    final fromSnapshotConstructor = Constructor(
      ($) => $
        ..name = 'fromSnapshot'
        ..optionalParameters.add(
          Parameter(
            (p) => p
              ..name = 'initialValue'
              ..type = TypeReference((t) => t
                ..symbol = snapshot.model.name
                ..url = snapshot.fileName
                ..isNullable = true),
          ),
        )
        ..initializers.addAll(
          fields.map(
            (f) {
              final ctr = f.controller.invokeController(
                refer('initialValue?').property(f.name),
              );
              return refer(f.name).assign(ctr).code;
            },
          ),
        ),
    );

    final formKeyField = Field(
      ($) => $
        ..modifier = FieldModifier.final$
        ..name = 'formKey'
        ..type = refer('GlobalKey<FormState>', 'package:flutter/material.dart')
        ..assignment = const Code('GlobalKey<FormState>()'),
    );

    final validateMethod = Method(
      ($) => $
        ..name = 'validate'
        ..returns = refer('bool')
        ..lambda = true
        ..body = const Code('formKey.currentState!.validate()'),
    );

    final snapshotMethod = Method(
      ($) => $
        ..name = 'snapshot'
        ..returns = refer(snapshot.model.name, snapshot.fileName)
        ..lambda = true
        ..body = refer(snapshot.model.name).newInstance([], {
          for (final field in fields)
            field.name: field.controller.accessValue(refer(field.name))
        }).code,
    );

    return Class(
      ($) => $
        ..name = className
        ..constructors.addAll([
          constructor,
          fromSnapshotConstructor,
        ])
        ..fields.add(
          formKeyField,
        )
        ..fields.addAll(controllerFields)
        ..methods.addAll(
          [
            validateMethod,
            snapshotMethod,
          ],
        ),
    );
  }
}
