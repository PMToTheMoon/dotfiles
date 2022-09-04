import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'guide_editing_controller.dart';

class SalaryEditingController extends GuideEditingController {
  int? get salary {
    return int.tryParse(text);
  }

  SalaryEditingController({int? salary})
      : super(
          guide: '40k',
          text: salary.toString(),
        );
}

class SalaryField extends StatelessWidget {
  const SalaryField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TbtTextField(
      inputFormatters: [
        TextInputFormatter.withFunction((oldValue, newValue) {
          final newText = newValue.text.characters;
          final oldText = oldValue.text.characters;
          TextEditingValue result = newValue;

          if (newText.length == 2) {
            if (oldText.length < newText.length) {
              result = newValue.copyWith(
                text: '${newText}k',
                selection: TextSelection(
                  baseOffset: newText.length + 1,
                  extentOffset: newText.length + 1,
                ),
              );
            } else if (oldText.length > newText.length) {
              result = newValue.copyWith(
                text: newText.first,
                selection: const TextSelection(
                  baseOffset: 1,
                  extentOffset: 1,
                ),
              );
            }
          }
          return result;
        })
      ],
    );
  }
}
