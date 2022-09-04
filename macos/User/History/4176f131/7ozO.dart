import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class Identity extends StatelessWidget {
  const Identity({
    required this.avatar,
    required this.firstName,
    this.lastName,
    this.subtitle,
    this.avatarRadius,
    super.key,
  });

  final ImageProvider avatar;
  final String firstName;
  final String? lastName;
  final String? subtitle;
  final double? avatarRadius;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      verticalDirection: VerticalDirection.down,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
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
              context.headlineSmall(
                _composeName(firstName, lastName),
                softWrap: true,
              ),
              if (subtitle != null) context.bodyLarge(subtitle!),
            ],
          ),
        )
      ],
    );
  }
}

String _composeName(String firstName, String? lastName) =>
    lastName != null ? '$firstName $lastName' : firstName;
