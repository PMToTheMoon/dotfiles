import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> fields() => [
      LabeledTextField(
        decoration: InputDecoration(
          hintText: 'hint',
          labelText: 'label',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      )
    ];
