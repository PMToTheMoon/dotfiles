import 'package:flutter/material.dart';

Widget fields() => Column(
      children: const [
        TextField(
          decoration: InputDecoration(
            hintText: 'hint',
            labelText: 'label',
          ),
        )
      ],
    );
