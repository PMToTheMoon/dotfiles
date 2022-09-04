import 'package:flutter/material.dart' hide Page;
import 'package:common/common.dart';
import 'package:neat/neat.dart';
import '/trip_details/contact/contact.dart';

class ContactPageArguments {
  const ContactPageArguments({
    required this.trip,
  });

  final Trip trip;
}

class ContactPageResult {
  const ContactPageResult();
}

class ContactPage extends StatelessWidget {
  static Future<ContactPageResult> open(
    BuildContext context,
    ContactPageArguments arguments,
  ) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactPage(
          arguments: arguments,
        ),
      ),
    );
    return result as ContactPageResult;
  }

  static void goBack(
    BuildContext context,
    ContactPageResult result,
  ) =>
      Navigator.of(context).pop(result);

  const ContactPage({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final ContactPageArguments arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        goBack(context, const ContactPageResult());
        return false;
      },
      child: const _ContactPage(),
    );
  }
}

class _ContactPage extends StatelessWidget {
  const _ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page(
      appBar: titledAppBar(context, title: "Service Client"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          context.bodyText2(
              "Un problème avace votre course ? Contactez le service client."),
          const Space3.h(),
          Row(
            children: [
              Expanded(child: context.subtitle2("Commande n°189")),
              context.bodyText2("10/20/10"),
            ],
          ),
          const Space4.h(),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Votre commantaire...",
            ),
            minLines: 8,
            maxLines: null,
          ),
          const Space3.h(),
          Button.primary("envoyer", () {}, expands: true),
        ],
      ),
    );
  }
}
