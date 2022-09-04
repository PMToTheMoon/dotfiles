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
