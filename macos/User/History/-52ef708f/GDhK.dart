import 'package:common/common.dart';
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

  final ImageProvider avatar;
  final String firstName;
  final String lastName;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          foregroundImage: avatar,
          radius: Dimensions.sizeMedium / 2,
        )
      ],
    )
  }
}

class _IdentitySimple extends StatelessWidget implements Identity {
  @override
  Widget build(BuildContext context) {
    return const Text('Identity');
  }
}
