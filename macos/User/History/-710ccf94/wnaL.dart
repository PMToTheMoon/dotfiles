import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class ChipEditorFormFieldController extends FormFieldController {
  @override
  Expression accessValue(Expression controller) => controller.property('value');

  @override
  Reference get controllerType =>
      refer('ChipEditingController', 'package:common/common.dart');

  @override
  Expression invokeController(Expression initialValue) {
    throw UnimplementedError();
  }

  @override
  Reference get valueType => refer('Set<String>');
}

class ChipEditorFormFieldWidget extends FormPartWidget {
  @override
  Expression get widgetType =>
      refer('ChipEditorFormField', 'package:common/common.dart');
}

class ChipEditorFormField extends FormField {
  ChipEditorFormField(super.name, {this.label});

  final Expression? label;

  @override
  FormFieldController get controller => ChipEditorFormFieldController();

  @override
  FormPartWidget get widget => ChipEditorFormFieldWidget();
}

class ChipSelectorFormField extends FormField {
  ChipSelectorFormField(
    super.name, {
    required this.chips,
    required this.title,
    required this.label,
    this.maxChipSelected,
    this.padding,
    this.validator,
  });

  final Set<Expression> chips;
  final Expression title;
  final Expression label;
  final Expression? padding;
  final int? maxChipSelected;
  final Expression? validator;

  @override
  Reference get type => refer('Set<String>');

  @override
  Reference get controller =>
      refer('ChipSelectorController', 'package:common/common.dart');

  @override
  Expression get getValue => refer('$name.value');

  @override
  Expression get invokeController => controller.newInstance([], {
        'value': refer('initialValue?.$name'),
      });

  @override
  Expression get invokeWidget => refer('Column').newInstance([], {
        'crossAxisAlignment': refer('CrossAxisAlignment.stretch'),
        'children': literalList([
          refer('context.headlineMedium', 'package:neat/neat.dart')
              .call([title]).maybePadding(padding),
          refer('const SpaceSmaller.h()'),
          refer('context.bodyMedium', 'package:neat/neat.dart')
              .call([label]).maybePadding(padding),
          refer('const SpaceSmaller.h()'),
          refer('ChipSelectorFormField', 'package:common/common.dart')
              .newInstance([], {
            'chips': literal(chips),
            'controller': referController,
            'padding': padding ?? refer('null'),
            'maxChipSelected': literal(maxChipSelected),
            if (validator != null) 'validator': validator!,
          }),
        ]),
      });
}
