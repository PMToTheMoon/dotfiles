import 'package:flutter/material.dart' hide Page;

class ContactPage extends StatelessWidget {
  static const String route = "/route";

  static Widget builder(BuildContext context) => const ContactPage();

  static Future<void> open(
    BuildContext context,
  ) =>
      Navigator.of(context).pushNamed(
        route,
      );

  static void goBack(
    BuildContext context,
  ) =>
      Navigator.of(context).pop();

  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _ContactPage();
  }
}

class _ContactPage extends StatelessWidget {
  const _ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Page(
      alignment: Alignment.center,
      body: Center(
        child: Text("Contact"),
      ),
    );
  }
}
