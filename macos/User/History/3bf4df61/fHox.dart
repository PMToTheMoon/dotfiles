import 'package:bonemeal_core/src/meta_object/build_step.dart';

import 'form_part.dart';

class FormDecoration extends FormPart {
  @override
  FormPartMetaData build(BuildStep step) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement path
  String get path => throw UnimplementedError();

  Iterable<Expression> widgetInvocations(Expression accessController) {
    return [invokeWidget(accessController)];
  }
}
