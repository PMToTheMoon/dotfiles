import 'package:bonemeal/bonemeal.dart';
import 'package:flutter/material.dart';
import 'package:form_generator/form_generator.dart';

// class ChipEditorFormField extends FormField {
//   ChipEditorFormField(
//     super.name, {
//     this.label,
//   });

//   final Expression? label;

//   @override
//   Reference get controller =>
//       refer('ChipEditingController', 'package:common/common.dart');

//   @override
//   Expression get getValue => refer('$name.value');

//   @override
//   Expression get invokeController => refer('ChipEditingController').newInstance(
//         [],
//         {'value': refer('initialValue?.$name')},
//       );

//   @override
//   Expression get invokeWidget => refer('ChipEditorFormField').newInstance([], {
//         'controller': referController,
//         if (label != null) 'label': label!,
//       });

//   @override
//   Reference get type => refer('Set<String>');
// }

class ChipEditorFormFieldController extends FormFieldController {
  @override
  Expression accessValue(Expression controller) => controller.property('value');

  @override
  Reference get controllerType =>
      refer('ChipEditorFormField', 'package:common/common.dart');

  @override
  Expression invokeController(Expression initialValue) {
    throw UnimplementedError();
  }

  @override
  Reference get valueType => refer('Set<String>');
}

class ChipEditorFormField extends FormField {
  ChipEditorFormField(super.name, {this.label});

  final Expression? label;
}
