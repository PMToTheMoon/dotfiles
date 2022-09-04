import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/from_controller/form_field_controller.dart';

class FormControllerMetaData {
  FormControllerMetaData({
    required this.snapshot,
    required this.controller,
  });

  final Class snapshot;
  final Class controller;
}

class FormControllerField {
  FormControllerField(
    this.valueType,
    this.name, {
    required this.controller,
  });

  final String name;
  final Reference valueType;
  final FormFieldController controller;
}

class FormController extends MetaObject<FormControllerMetaData> {
  FormController({
    required this.subject,
    required this.fields,
  });

  final String subject;
  final List<FormControllerField> fields;

  @override
  FutureOr<FormControllerMetaData> build(BuildStep step) {
    final className = '${subject.pascalCase}Controller';
    final fileName = '${subject.snakeCase}_controller.dart';
    final controllerFields = _buildControllerFields();
    final snapshotFields = _buildSnapshotFields();

    final controllerConstructor = Constructor(
      ($) => $
        ..optionalParameters.addAll(
          controllerFields.toNamedParameters(toThis: false),
        )
        ..initializers.addAll(fields.map(
          (f) => f.controller.invokeController(refer(f.name)).code,
        )),
    );
    final controller = Class(
      ($) => $
        ..name = className
        ..constructors.add(controllerConstructor)
        ..fields.addAll(controllerFields),
    );

    final library = Library(
      ($) => $
        ..body.addAll([
          controller,
        ]),
    );

    step.emit(fileName, library);

    return FormControllerMetaData(
      snapshot: snapshot,
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
      fields.map((f) => field(f.name, f.valueType)).toSet(),
    );
  }
}
