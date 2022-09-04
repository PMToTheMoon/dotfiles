import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> forms(BuildContext context) => [
      DropdownButtonFormField(
        value: 0,
        onChanged: (_) {},
        borderRadius: BorderRadius.circular(
          Dimensions.borderRadiusMedium,
        ),
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
