import 'package:flutter/material.dart';

List<Widget> fields() => [
      const TextField(
        decoration: InputDecoration(
          hintText: 'hint',
          labelText: 'label',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(),
        ),
      )
    ];
