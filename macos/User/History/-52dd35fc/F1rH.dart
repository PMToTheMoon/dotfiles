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
      Expression accessController, Iterable<FormPartMetaData> partsMeta);

  dynamic buildSection(
    BuildStep step,
    Expression children,
  ) {}

  @override
  FormPartMetaData build(BuildStep step) {
    final partsMeta = step.buildAll(parts);

    return FormPartMetaData(
      name: name,
      invokeWidget: (accessController) {},
      controllerFields: partsMeta.expand((meta) => meta.controllerFields),
    );
  }

  Expression _onInvokeWidget(
    Expression accessController,
    Iterable<FormPartMetaData> partsMeta,
  ) {
    final children = literalList(
      partsMeta.map((p) => p.invokeWidget(accessController)),
    );
    buildSection(step, children);
    return invokeWidget(
      accessController,
      partsMeta,
    );
  }
}
