import 'package:flutter/material.dart';

abstract class Identity extends StatelessWidget {
  const Identity({
    super.key,
    ImageProvider? avatar,
    String? firstName,
    String? lastName,
    String? subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Identity');
  }
}
