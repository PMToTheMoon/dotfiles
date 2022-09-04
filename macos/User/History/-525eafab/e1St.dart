import 'package:flutter/material.dart';

class BorderCard extends StatelessWidget {
  const BorderCard({super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return const Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(),
      ),
      child: Child,
    );
  }
}
