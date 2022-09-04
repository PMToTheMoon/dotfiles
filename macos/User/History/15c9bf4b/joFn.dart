import 'package:common/common.dart';
import 'package:flutter/material.dart';

final avatar = NetworkImage(
    "https://lh3.googleusercontent.com/qz73psfKpzXnummf4lvrWGNmL21hCcQ4x3Cld_5MP8Lu11RqBX_A03eJU5VYI17R8Q");

List<Widget> identities(BuildContext context) => [
      Identity.vertical(
        avatar: avatar,
        firstName: "Rembrandt",
        lastName: "Harmenszoon van Rijn",
        subtitle: "Peintre à l'huile",
      ),
      const SpaceSmall(),
      Identity.vertical(
        avatar: avatar,
        firstName: "Rembrandt",
        lastName: "Harmenszoon van Rijn",
      ),
      const SpaceSmall(),
      Identity.horizontal(
        avatar: avatar,
        firstName: "Rembrandt",
        lastName: "Harmenszoon van Rijn",
        subtitle: "Peintre à l'huile",
      ),
      const SpaceSmall(),
      Identity.horizontal(
        avatar: avatar,
        firstName: "Rembrandt",
        lastName: "Harmenszoon van Rijn",
      ),
    ];
