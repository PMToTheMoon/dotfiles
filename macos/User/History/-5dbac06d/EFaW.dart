import 'package:bonemeal/bonemeal.dart';
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

class IntFormFieldWidget extends TextFormFieldWidget {
  IntFormFieldWidget({
    this.label,
    this.hint,
    this.validator,
    this.decorations = const {},
    super.parameters,
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
      widget: TextFormFieldWidget(parameters: {
        'keyboardType': refer('TextInputType.number'),
        'inputFormatters': refer(
            '<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]',
            'package:flutter/services.dart'),
      }),
      controller: IntFormFieldController(nullable: nullable),
    );
  }
}
