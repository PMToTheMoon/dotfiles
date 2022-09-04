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
  Expression accessValue(Expression controller) => refer(nullable ? 'int.tryParse($name.text)' : 'int.parse($name.text)');

  @override
  Expression invokeController(Expression initialValue) => controllerType.newInstance([], {
    'text': initialValue.property('toString()').call([]),
  });
}

class IntFormField extends Seed {
  final String name;
  final bool nullable;

  @override
  MetaObject grow(BuildContext context) {
    // TODO: implement grow
    return TextFormField(name, controller: );
  }
}
