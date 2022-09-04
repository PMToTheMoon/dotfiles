import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class BorderContainer extends Container {
  BorderContainer({super.child, super.padding})
      : super(
          decoration: BoxDecoration(
            border: Border.all(),
            color: context.colorScheme.surface,
          ),
        );
}
