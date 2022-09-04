import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> fields() => [
      LabeledTextField(
        label: 'label',
      ),
      const SpaceSmall(),
      TextField(
        enabled: false,
      )
    ];
