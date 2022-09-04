import 'package:flutter/material.dart';

List<Widget> forms(BuildContext context) => [
      DropdownButtonFormField(
        value: 0,
        onChanged: (_) {},
        items: [
          DropdownMenuItem(
            child: Text("test"),
            value: 0,
          ),
          DropdownMenuItem(
            child: Text("test"),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("test"),
            value: 2,
          ),
        ],
      )
    ];
