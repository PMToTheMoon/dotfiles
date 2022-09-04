import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> forms(BuildContext context) => [
      StatefulBuilder(builder: () {}),
      Center(
        child: HorizontalOptionSelect(
          options: [
            'a',
            'b',
          ],
          onChanged: (String value) {},
          value: 'a',
        ),
      ),
      const SpaceSmall(),
      TbtDropdownFormField(
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
