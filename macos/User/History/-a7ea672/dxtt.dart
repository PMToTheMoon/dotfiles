import 'package:common/common.dart';
import 'package:common/src/widgets/text_fields/date_picker_field.dart';
import 'package:flutter/material.dart';

List<Widget> fields() => [
      const SalaryField(),
      const SpaceSmall(),
      const MMyDatePickerField(),
      const SpaceSmall(),
      TbtTextField(
        // label: 'Nom',
        decoration: const InputDecoration(
          labelText: 'Nom',
          hintText: 'Dupon',
        ),
      ),
      const SpaceSmall(),
      const TextField(
        enabled: false,
      ),
      const SpaceSmall(),
      SearchBar(),
    ];
