import 'package:bonemeal/bonemeal.dart';

import 'form_part.dart';

abstract class FormDecoration extends FormPart {
  @override
  FormPartMetaData build(BuildStep step) {
    return FormPartMetaData(
      widgetInvocations: (_) => widgetInvocations(),
      controllerFields: [],
    );
  }

  @override
  String get path => '';

  Iterable<Expression> widgetInvocations();
}
