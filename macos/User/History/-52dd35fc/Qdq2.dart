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

  Expression buildSection(
    BuildStep step,
    Expression accessController,
    Iterable<FormPartMetaData> partsMeta,
  ) {}

  @override
  FormPartMetaData build(BuildStep step) {
    final partsMeta = step.buildAll(parts);

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
