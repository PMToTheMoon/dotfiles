import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> forms(BuildContext context) => [
      TbtDropdownFormField(
        value: 0,
        onChanged: (_) {},
        items: [
          CupertinoSegmentedControl(
              children: children, onValueChanged: onValueChanged),
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
