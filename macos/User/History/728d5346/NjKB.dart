import 'package:flutter/material.dart';

List<Widget> buttons() => [
      ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
      const ElevatedButton(onPressed: null, child: Text('Elevated disabled')),
      OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
      const OutlinedButton(onPressed: null, child: Text('Outlined disabled')),
      TextButton(onPressed: () {}, child: const Text('Text')),
      const TextButton(onPressed: null, child: Text('Text disabled')),
    ];
