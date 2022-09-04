import 'package:app_client/sign_in/code/code.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:common/common.dart';
import 'package:neat/neat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/trip_details/contact/contact.dart';

class ContactPageArguments {
  const ContactPageArguments({
    required this.trip,
  });

  final Trip trip;
}

class ContactPage extends StatelessWidget {
  static Future<void> open(
    BuildContext context,
    ContactPageArguments arguments,
  ) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactPage(
          arguments: arguments,
        ),
      ),
    );
  }

  const ContactPage({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final ContactPageArguments arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactBloc(),
      child: _ContactPage(
        trip: arguments.trip,
      ),
    );
  }
}

class _ContactPage extends StatelessWidget {
  _ContactPage({
    Key? key,
    required this.trip,
  }) : super(key: key);

  final Trip trip;
  final TextEditingController controller = TextEditingController();

  _onSubmit(BuildContext context) => context
      .read<ContactBloc>()
      .add(ContactEvent.messageSubmitted(message: controller.text));

  _onStateChanged(BuildContext context, ContactState state) {
    if (state is ContactStateError) {
      showError(context, message: ":(");
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((ContactBloc bloc) => bloc.state);

    return BlocListener<ContactBloc, ContactState>(
      listener: _onStateChanged,
      child: Page(
        appBar: titledAppBar(context, title: "Service Client"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            context.bodyText2(
                "Un problème avace votre course ? Contactez le service client."),
            const Space3.h(),
            context.subtitle2("Commande n°${trip.id}"),
            context.bodyText2(trip.date.fullDateTimeVerboseDisplay(context)),
            const Space5.h(),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Votre commantaire...",
              ),
              minLines: 8,
              maxLines: null,
            ),
            const Space3.h(),
            SubmitButton(
                onSubmit: () => _onSubmit(context),
                loading: state is ContactStateSubmitting),
          ],
        ),
      ),
    );
  }
}
