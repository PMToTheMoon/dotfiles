// import 'package:bonemeal/bonemeal.dart';

// import 'text_form_field.dart';

// class DoubleFormField extends TextFormField {
//   DoubleFormField(
//     super.name, {
//     super.label,
//     super.hint,
//     super.validator,
//     this.nullable = true,
//   }) : super(parameters: {
//           'keyboardType': refer('TextInputType.number'),
//           'inputFormatters': refer(
//             "[FilteringTextInputFormatter.allow(RegExp(r'[0-9|.]'))]",
//             'package:flutter/services.dart',
//           ),
//         });

//   final bool nullable;

//   @override
//   TypeReference get type => TypeReference((t) => t
//     ..symbol = 'double'
//     ..isNullable = nullable);

//   @override
//   InvokeExpression get invokeController => InvokeExpression.newOf(
//         refer('TextEditingController', 'package:flutter/material.dart'),
//         [],
//         {
//           'text': refer('initialValue?.$name.toString()'),
//         },
//       );

//   @override
//   Expression get getValue => refer(
//       nullable ? 'double.tryParse($name.text)' : 'double.parse($name.text)');
// }

import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class DoubleFormFieldController extends TextFormFieldController {
  DoubleFormFieldController({
    this.nullable = true,
  });

  final bool nullable;

  @override
  Reference get valueType => nullable ? refer('double?') : refer('double');

  @override
  Expression accessValue(Expression controller) => nullable
      ? refer('double.tryParse').call([controller.property('text')])
      : refer('double.parse').call([controller.property('text')]);

  @override
  Expression invokeController(Expression initialValue) =>
      controllerType.newInstance([], {
        'text': initialValue.property('toString').call([]),
      });
}

class DoubleFormField extends Seed<FormPartMetaData> {
  DoubleFormField(this.name, {this.nullable = true});

  final String name;
  final bool nullable;

  @override
  MetaObject<FormPartMetaData> grow(BuildContext context) {
    return TextFormField(
      name,
      widget: TextFormFieldWidget(parameters: import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class IntFormFieldController extends TextFormFieldController {
  IntFormFieldController({
    this.nullable = true,
  });

  final bool nullable;

  @override
  Reference get valueType => nullable ? refer('int?') : refer('int');

  @override
  Expression accessValue(Expression controller) => nullable
      ? refer('int.tryParse').call([controller.property('text')])
      : refer('int.parse').call([controller.property('text')]);

  @override
  Expression invokeController(Expression initialValue) =>
      controllerType.newInstance([], {
        'text': initialValue.property('toString').call([]),
      });
}

class IntFormField extends Seed<FormPartMetaData> {
  IntFormField(this.name, {this.nullable = true});

  final String name;
  final bool nullable;

  @override
  MetaObject<FormPartMetaData> grow(BuildContext context) {
    return TextFormField(
      name,
      controller: IntFormFieldController(nullable: nullable),
    );
  }
}
),
      controller: DoubleFormFieldController(nullable: nullable),
    );
  }
}
