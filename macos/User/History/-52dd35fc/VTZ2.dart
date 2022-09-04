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
    final children = literalList(
      partsMeta.map((p) => p.invokeWidget(accessController)),
    );
    buildSection(step, partsMeta);

    return FormPartMetaData(
      name: name,
      invokeWidget: (accessController) => invokeWidget(
        accessController,
        partsMeta,
      ),
      controllerFields: partsMeta.expand((meta) => meta.controllerFields),
    );
  }
}
