import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _opt = 'a';

List<Widget> forms(BuildContext context) => [
      StatefulBuilder(builder: (context, setState) {
        return HorizontalOptionSelect(
          options: [
            'a',
            'b',
          ],
          onChanged: (String value) {
            setState(
              () => _opt = value,
            );
          },
          value: _opt,
        );
      }),
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
