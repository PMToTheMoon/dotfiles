import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

export 'identity_list.dart';

class Identity extends StatelessWidget {
  const Identity({
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
