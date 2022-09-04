import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:model_generators/model_generators.dart';

export 'form_field_controller.dart';

class FormControllerMetaData {
  FormControllerMetaData({
    required this.snapshot,
    required this.controller,
  });

  final ModelMetaData snapshot;
  final Class controller;
}

class FormControllerField {
  FormControllerField.fromFormField(FormField field)
      : name = field.name,
        controller = field.controller;

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
  final Iterable<FormControllerField> fields;

  @override
  String get path => '${formName.snakeCase}_controller.dart';

  @override
  FormControllerMetaData build(BuildStep step) {
    final controllerClassName = '${formName.pascalCase}Controller';
    final snapshotClassName = '${formName.pascalCase}Snapshot';
    final controllerFields = _buildControllerFields();
    final snapshotFields = _buildSnapshotFields();

    final snapshot = Model(
      className: snapshotClassName,
      fields: snapshotFields,
    );
    final snapshotMetaData = step.build(snapshot);

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

    step.emit(library);

    return FormControllerMetaData(
      snapshot: snapshotMetaData,
      controller: controller,
    );
  }

  Fields _buildControllerFields() {
    return Fields(
      fields
          .map(
            (f) => field(f.name, f.controller.controllerType),
          )
          .toSet(),
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
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'initialValue'
              ..type = snapshot.reference.toNullable(),
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
        ..returns = snapshot.reference
        ..lambda = true
        ..body = snapshot.reference.newInstance([], {
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
