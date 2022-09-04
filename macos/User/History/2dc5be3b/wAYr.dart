// ignore_for_file: always_declare_return_types

import 'package:flutter/material.dart';

_buildBottomSheets(BuildContext context) => [
  ElevatedButton(onPressed: () {
    showModalBottomSheet(context: context, builder: (context) {

    })
  }, child: Text("Show bottom sheet"),),
];