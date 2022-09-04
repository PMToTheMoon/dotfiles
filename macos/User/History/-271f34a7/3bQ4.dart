import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';
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
          const TechByTechLogo(),
          const Spacer(),
          TextButton(
            onPressed: () => launchUrl(Uri.parse('https://flutter.dev/')),
            child: Text(context.l10n.auth_app_bar_services_link),
          ),
          TextButton(
            onPressed: () => launchUrl(Uri.parse('https://flutter.dev/')),
            child: Text(context.l10n.auth_app_bar_information_link),
          ),
          TextButton(
            onPressed: () => launchUrl(Uri.parse('https://flutter.dev/')),
            child: Text(context.l10n.auth_app_bar_contact_link),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(0, 110);
}
