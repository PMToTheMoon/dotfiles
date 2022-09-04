import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

abstract class FormSection extends FormPart {
  FormSection({
    required this.name,
    required this.parts,
    required this.invokeWidget,
  });

  final String name;
  final List<FormPart> parts;
  final Expression Function(
          Expression accessController, Iterable<FormPartMetaData> partsMeta)
      invokeWidget;

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
