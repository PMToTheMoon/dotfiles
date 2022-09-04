import 'package:flutter/material.dart';

Widget fields() => Column(
      children: const [
        Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'hint',
              labelText: 'label',
            ),
          ),
        )
      ],
    );
