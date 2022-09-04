// ignore_for_file: always_declare_return_types

import 'package:common/src/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';

_buildBottomSheets(BuildContext context) => [
      ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => ZanalysBottomSheet(),
          );
        },
        child: Text("Show bottom sheet"),
      ),
    ];
