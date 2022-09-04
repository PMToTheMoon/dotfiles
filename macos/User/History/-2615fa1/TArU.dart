import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

abstract class IdentityData {
  String get id;
  String get firstName;
  String? get lastName;
  String? get subtitle;
}

abstract class Identity extends StatelessWidget {
  factory Identity(
    IdentityData data, {
    ImageProvider Function(String) avatarBuilder,
    Key? key,
  }) {
    if (data.subtitle != null) {
      return _IdentityFull(
        avatar: data.avatar,
        firstName: data.firstName,
        lastName: data.lastName,
        subtitle: data.subtitle!,
        key: key,
      );
    }
    return _IdentitySimple(
      avatar: data.avatar,
      firstName: data.firstName,
      lastName: data.lastName,
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
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          foregroundImage: avatar,
          radius: Dimensions.sizeSmall / 2,
        ),
        const SpaceSmaller.w(),
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.titleSmall(
                _composeName(firstName, lastName),
                // maxLines: 1,
                softWrap: true,
                // overflow: TextOverflow.ellipsis,
              ),
              context.bodySmall(subtitle),
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
        const SpaceSmaller.w(),
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
