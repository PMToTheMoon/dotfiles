import 'package:common/common.dart';

const dec = r"""
MultiLineTextFormField(
  controller: $controller,
  hint: context.l10n.hidden_reason_hint,
  validator: (value) {
    if (value?.isNotEmpty == true) return null;
    if (_controller.patientReason.text.isNotEmpty == true) {
      return null;
    }
    return 'pas content';
  },
)""";
