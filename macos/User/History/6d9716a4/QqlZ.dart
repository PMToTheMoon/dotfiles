import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _opt = 'a';

List<Widget> forms(BuildContext context) => [
      InputDatePickerFormField(
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          Duration(days: 3),
        ),
      ),
      const SpaceSmall(),
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
          initialValue: _opt,
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
