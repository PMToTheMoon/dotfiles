// import 'package:bonemeal/bonemeal.dart';
// import 'package:form_generator/form_generator.dart';

// class IntFormField extends TextFormField {
//   IntFormField(
//     super.name, {
//     super.label,
//     super.hint,
//     super.validator,
//     this.nullable = true,
//   }) : super(parameters: {
//           'keyboardType': refer('TextInputType.number'),
//           'inputFormatters': refer(
//               '<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]',
//               'package:flutter/services.dart'),
//         });

//   final bool nullable;

//   @override
//   TypeReference get type => TypeReference((t) => t
//     ..symbol = 'int'
//     ..isNullable = nullable);



//   @override
//   Expression get getValue =>
//       refer(nullable ? 'int.tryParse($name.text)' : 'int.parse($name.text)');
// }


import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';


class IntFormFieldController extends TextFormFieldController {
  IntFormFieldController({this.nullable = true,});

  final bool nullable;

  @override
  Reference get valueType => nullable ? refer('int?') : refer('int');

  @override
  Expression accessValue(Expression controller) => controller.property('text');

  @override
  Expression get invokeController => InvokeExpression.newOf(
        refer('TextEditingController', 'package:flutter/material.dart'),
        [],
        {
          'text': refer('initialValue?.$name.toString()'),
        },
      );
}

class IntFormField extends Seed {
  final String name;

  @override
  MetaObject grow(BuildContext context) {
    // TODO: implement grow
    return TextFormField(name, controller: );
  }
}
