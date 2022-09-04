import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> buttons() => [
      ElevatedButton(onPressed: () {}, child: Text('Elevated')),
      OutlinedButton(onPressed: () {}, child: Text('Outlined')),
      TextButton(onPressed: () {}, child: Text('Text')),
    ];
