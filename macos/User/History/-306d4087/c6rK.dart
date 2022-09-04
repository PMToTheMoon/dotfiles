import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/ipr.dart';

class ChipSelectorFormField extends FormField {
  ChipSelectorFormField(
    super.name, {
    required this.chips,
    required this.title,
    required this.label,
    this.padding,
  });

  final Set<Expression> chips;
  final Expression title;
  final Expression label;
  final Expression? padding;

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
  Expression get invokeWidget {
    if (padding != null) {
      return wrapWithPadding(_invokeWidget(), padding!);
    }
    return _invokeWidget();
  }

  Expression _invokeWidget() => refer('Column').newInstance([], {
        'crossAxisAlignment': refer('CrossAxisAlignment.stretch'),
        'children': literalList([
          refer('context.titleMedium', 'package:neat/neat.dart')
              .call([title]).maybePadding(padding),
          refer('context.bodyMedium', 'package:neat/neat.dart')
              .call([label]).maybePadding(padding),
          refer('ChipSelectorFormField', 'package:common/common.dart')
              .newInstance([], {
            'chips': literal(chips),
            'controller': referController,
          }),
        ]),
      });
}
