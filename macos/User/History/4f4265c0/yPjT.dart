import 'package:code_builder/code_builder.dart';
import 'package:bonemeal/bonemeal.dart';

final emitter = DartEmitter(useNullSafetySyntax: true, allocator: Allocator());

void main() {
  final t = refer('''
(value) {
  if (value?.isNotEmpty == true) return null;
  if (_controller.patientReason.text.isNotEmpty == true) {
    return null;
  }
  return context.l10n.hidden_reason_error;
}''');
  print(t.accept(emitter));
}
