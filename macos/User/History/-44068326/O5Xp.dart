import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> fields() => [
      const LabeledTextField(
        label: 'Nom',
        decoration: InputDecoration(
          hintText: 'Dupon',
        ),
      ),
      const SpaceSmall(),
      TextField(
        enabled: false,
      )
    ];
