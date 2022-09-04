import 'package:flutter/material.dart';

List<Widget> fields() => [
      TextField(
        decoration: InputDecoration(
          hintText: 'hint',
          labelText: 'label',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      )
    ];
