import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> fields() => [
      LabeledTextField(
        label: 'label',
        decoration: InputDecoration(
          hintText: 'hint',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      )
    ];
