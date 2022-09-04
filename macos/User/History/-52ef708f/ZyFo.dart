import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

abstract class Identity extends StatelessWidget {
  factory Identity({
    required ImageProvider avatar,
    required String firstName,
    String? lastName,
    String? subtitle,
    Key? key,
  }) {
    if (subtitle != null) {
      return _IdentityFull(
        avatar: avatar,
        firstName: firstName,
        lastName: lastName,
        subtitle: subtitle,
        key: key,
      );
    }
    return _IdentitySimple(
      avatar: avatar,
      firstName: firstName,
      lastName: lastName,
      key: key,
    );
  }
}

class _IdentityFull extends StatelessWidget implements Identity {
  const _IdentityFull({
    required this.avatar,
    required this.firstName,
    this.lastName,
    required this.subtitle,
    super.key,
  });

  final ImageProvider avatar;
  final String firstName;
  final String? lastName;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          foregroundImage: avatar,
          radius: Dimensions.sizeSmall / 2,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              context.titleMedium(_composeName(firstName, lastName)),
              context.bodyMedium(subtitle),
            ],
          ),
        )
      ],
    );
  }
}

class _IdentitySimple extends StatelessWidget implements Identity {
  const _IdentitySimple({
    required this.avatar,
    required this.firstName,
    this.lastName,
    super.key,
  });

  final ImageProvider avatar;
  final String firstName;
  final String? lastName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          foregroundImage: avatar,
          radius: Dimensions.sizeSmall / 2,
        ),
        Expanded(
          child: context.titleMedium(
            _composeName(firstName, lastName),
          ),
        ),
      ],
    );
  }
}

String _composeName(String firstName, String? lastName) =>
    lastName != null ? '$firstName $lastName' : firstName;
