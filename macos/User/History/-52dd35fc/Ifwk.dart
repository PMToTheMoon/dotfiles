import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

abstract class FormSection extends FormPart {
  FormSection({
    required this.fields,
  });

  final String name;
  final List<FormPart> parts;
  final Expression Function(Expression accessController, Iterable<FormPartMetaData> partsMeta) invokeWidget;

  @override
  FormPartMetaData build(BuildStep step) {
    final partsMeta = step.buildAll(parts);

    return FormPartMetaData(
      name: name,
      invokeWidget: ((accessController) => widget.invokeWidget(
        controller.accessValue(accessController),
      ),
      controllerFields: partsMeta.expand((meta) => meta.controllerFields),
    );
  }
}
