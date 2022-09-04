import 'package:flutter/material.dart';

abstract class Identity extends StatelessWidget {
  factory Identity({
    required ImageProvider avatar,
    Key? key,
    String? firstName,
    String? lastName,
    String? subtitle,
  }) {
    if (subtitle != null) return _IdentityFull();
    return _IdentitySimple();
  }
}

class _IdentityFull extends StatelessWidget implements Identity {
  _IdentityFull();

  @override
  Widget build(BuildContext context) {
    return const Text('Identity');
  }
}

class _IdentitySimple extends Identity {
  @override
  Widget build(BuildContext context) {
    return const Text('Identity');
  }
}
