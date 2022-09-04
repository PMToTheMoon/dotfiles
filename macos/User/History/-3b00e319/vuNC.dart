import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

enum Gender {
  male,
  female,
}

class GenderField extends StatelessWidget {
  const GenderField({
    super.key,
  });

  final ValueChanged<Gender> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _Option(),
        ),
        Expanded(
          child: _Option(),
        ),
      ],
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("male"),
      ),
    );
  }
}
