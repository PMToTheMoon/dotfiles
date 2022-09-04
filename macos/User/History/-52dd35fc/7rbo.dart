import 'package:bonemeal/bonemeal.dart';

import 'form_part.dart';

abstract class FormSection extends FormPart {
  FormSection({
    required this.name,
    required this.parts,
  });

  final String name;
  final List<FormPart> parts;

  Expression invokeWidget(
    BuildStep step,
    Expression accessController,
    Iterable<Expression> children,
  );

  @override
  FormPartMetaData build(BuildStep step) {
    final partsMeta = step.buildAll(parts);

    return FormPartMetaData(
      name: name,
      invokeWidget: (accessController) =>
          _onInvokeWidget(step, accessController, partsMeta),
      controllerFields: partsMeta.expand((meta) => meta.controllerFields),
    );
  }

  Expression _onInvokeWidget(
    BuildStep step,
    Expression accessController,
    Iterable<FormPartMetaData> partsMeta,
  ) {
    final children = partsMeta.map((p) => p.invokeWidget(accessController));

    return invokeWidget(
      step,
      accessController,
      children,
    );
  }
}
