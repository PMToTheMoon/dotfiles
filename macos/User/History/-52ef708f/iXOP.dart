import 'package:flutter/material.dart';

abstract class Identity extends StatelessWidget {
  factory Identity({
    Key? key,
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

class _IdentityFull extends Identity {
  @override
  Widget build(BuildContext context) {
    return const Text('Identity');
  }
}
