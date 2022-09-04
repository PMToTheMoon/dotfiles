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
      showError(context,
          message: context.l10n.contact_page_failed_to_send_error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((ContactBloc bloc) => bloc.state);

    return BlocListener<ContactBloc, ContactState>(
      listener: _onStateChanged,
      child: Page(
        appBar: titledAppBar(context, title: context.l10n.contact_page_title),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            context.bodyText2(context.l10n.contact_page_message),
            const Space3.h(),
            context.subtitle2("Commande n°${trip.id}"),
            context.bodyText2(trip.date.fullDateTimeVerboseDisplay(context)),
            const Space5.h(),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: context.l10n.contact_page_comment_hint,
                hintMaxLines: 8,
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
