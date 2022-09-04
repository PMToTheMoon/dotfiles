import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:url_launcher/url_launcher.dart';

PreferredSizeWidget authAppBar(BuildContext context) => AppBar(
      centerTitle: false,
      elevation: 0,
      title: Padding(
        padding: const PaddingLarger(left),
        child: context.displayMedium('TechByTech'),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text("Nos service"),
        ),
      ],
    );

class AuthAppBar extends StatelessWidget with PreferredSizeWidget {
  const AuthAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      // color: Colors.red,
      padding: const PaddingLargest.horizontal(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          context.displayMedium('TechByTech'),
          const Spacer(),
          TextButton(
            onPressed: () => launchUrl(
                'https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
            child: Text("Nos service"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("A propos"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Contact"),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(0, 110);
}
