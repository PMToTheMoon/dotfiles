import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

export 'identity_list.dart';

abstract class Identity extends StatelessWidget {
  factory Identity({
    required ImageProvider avatar,
    required String firstName,
    String? lastName,
    String? subtitle,
    bool inverted = false,
    double? avatarSize,
    Key? key,
  }) {
    final avatarRadius = avatarSize != null ? (avatarSize / 2.0) : null;
    if (subtitle != null) {
      return _IdentityFull(
        avatar: avatar,
        firstName: firstName,
        lastName: lastName,
        subtitle: subtitle,
        inverted: inverted,
        avatarRadius: avatarRadius,
        key: key,
      );
    }
    return _IdentitySimple(
      avatar: avatar,
      firstName: firstName,
      lastName: lastName,
      avatarRadius: avatarRadius,
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
    this.inverted = false,
    this.avatarRadius,
    super.key,
  });

  final ImageProvider avatar;
  final String firstName;
  final String? lastName;
  final String subtitle;
  final bool inverted;
  final double? avatarRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          foregroundImage: avatar,
          radius: avatarRadius ?? (Dimensions.sizeMedium / 2),
        ),
        const SpaceSmaller.w(),
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.titleMedium(
                _composeName(firstName, lastName),
                softWrap: true,
              ),
              context.bodyMedium(subtitle),
            ],
          ),
        )
      ],
    );
  }
}

String _composeName(String firstName, String? lastName) =>
    lastName != null ? '$firstName $lastName' : firstName;
