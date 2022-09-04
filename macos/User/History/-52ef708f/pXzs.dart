import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

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
          radius: Dimensions.sizeSmall / 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            context.titleMedium('$firstName $lastName'),
            context.bodyMedium(subtitle),
          ],
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
