import 'package:bonemeal/bonemeal.dart';

import 'form_part.dart';

abstract class FormDecoration extends FormPart {
  @override
  FormPartMetaData build(BuildStep step) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  String get path => '';

  Iterable<Expression> widgetInvocations();
}
