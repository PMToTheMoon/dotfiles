import 'package:bonemeal/bonemeal.dart';

import 'form_part.dart';

abstract class FormSection extends FormPart {
  FormSection({
    required this.parts,
  });

  final List<MetaObject<FormPartMetaData>> parts;

  Iterable<Expression> invokeWidgets(
    BuildStep step,
    Expression accessController,
    Iterable<Expression> children,
  );

  @override
  FormPartMetaData build(BuildStep step) {
    final partsMeta = step.buildAll(parts);

    return FormPartMetaData(
      widgetInvocations: (accessController) =>
          _onInvokeWidget(step, accessController, partsMeta),
      controllerFields: partsMeta.expand((meta) => meta.controllerFields),
    );
  }

  Iterable<Expression> _onInvokeWidget(
    BuildStep step,
    Expression accessController,
    Iterable<FormPartMetaData> partsMeta,
  ) {
    final children =
        partsMeta.expand((p) => p.widgetInvocations(accessController));

    return invokeWidgets(
      step,
      accessController,
      children,
    );
  }
}
