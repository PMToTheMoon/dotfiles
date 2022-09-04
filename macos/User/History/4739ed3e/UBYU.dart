import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class MultiLineFormFieldWidget extends Seed {
  MultiLineFormFieldWidget({
    required this.hint,
    this.validator,
    this.border = true,
  });

  final Expression hint;
  final Expression? validator;
  final bool border;

  @override
  Expression get widgetType =>
      refer('MultiLineTextFormField', 'package:common/common.dart');

  @override
  Map<String, Expression> defaultNamedParameters(Expression accessController) =>
      {
        ...defaultNamedParameters(accessController),
        // 'textInputAction': refer('TextInputAction.next'),
        'hint': hint,
        if (border != true) 'border': literal(border),
        if (validator != null) 'validator': validator!,
      };

  @override
  MetaObject grow(BuildContext context) {
    // TODO: implement grow
    throw UnimplementedError();
  }
}

class MultiLineFormFieldController extends TextFormFieldController {
  @override
  Expression accessValue(Expression controller) =>
      refer('convertToHtml').call([controller.property('text')]);
}

class IntFormField extends TextFormField {
  IntFormField(
    super.name, {
    super.label,
    super.hint,
    super.validator,
    super.decorations = const {},
    super.parameters = const {},
  }) : super(controller: IntFormFieldController());
}
