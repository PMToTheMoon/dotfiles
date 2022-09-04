import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> fields() => [
      LabeledTextField(
        label: 'Nom',
        decoration: const InputDecoration(
          hintText: 'Dupon',
        ),
      ),
      const SpaceSmall(),
      const TextField(
        enabled: false,
      )
    ];
