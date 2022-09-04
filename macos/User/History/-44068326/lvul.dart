import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> fields() => [
      TbtTextField(
        // label: 'Nom',
        decoration: const InputDecoration(
          labelText: 'Nom',
          hintText: 'Dupon',
        ),
      ),
      const SpaceSmall(),
      const TextField(
        enabled: false,
      ),
      const SpaceSmall(),
      SearchBar(),
    ];
