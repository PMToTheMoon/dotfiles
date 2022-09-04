part of 'trip_details_page.dart';

class _TripCommentEditor extends StatelessWidget {
  const _TripCommentEditor({
    Key? key,
    required this.transactionID,
    this.initialComment,
  }) : super(key: key);

  final int transactionID;
  final String? initialComment;

  _onTripCommentStateChanged(
    BuildContext context,
    TripCommentState state,
  ) {
    if (state is TripCommentError) {
      showError(context, message: context.l10n.error_indicator_message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripCommentBloc(
        transactionID: transactionID,
        reservationRepository: context.read(),
      ),
      child: BlocConsumer<TripCommentBloc, TripCommentState>(
        listener: _onTripCommentStateChanged,
        builder: (context, state) => _TripCommentEditorContent(
          initialComment: initialComment,
        ),
      ),
    );
  }
}

class _TripCommentEditorContent extends StatefulWidget {
  const _TripCommentEditorContent({
    Key? key,
    this.initialComment,
    this.onValidated,
  }) : super(key: key);

  final String? initialComment;
  final void Function(String)? onValidated;

  @override
  _TripCommentEditorContentState createState() =>
      _TripCommentEditorContentState();
}

class _TripCommentEditorContentState extends State<_TripCommentEditorContent> {
  _TripCommentEditorContentState();

  bool showSaveButton = false;

  late final TextEditingController _controller = TextEditingController(
    text: widget.initialComment,
  );

  @override
  void initState() {
    print(widget.initialComment);
    super.initState();
  }

  @override
  void didUpdateWidget() {
    _controller.text = widget.initialComment;
  }

  _onChanged(String value) {
    final save = value != widget.initialComment;
    if (save != showSaveButton) {
      setState(() => showSaveButton = save);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((TripCommentBloc bloc) => bloc.state);

    return Column(
      children: [
        TextField(
          onChanged: _onChanged,
          decoration: const InputDecoration(
            label: Text("Ajouter un commentaire à la course"),
          ),
          maxLines: null,
          controller: _controller,
        ),
        if (showSaveButton)
          Padding(
            padding: const Padding4(top),
            child: Align(
              alignment: Alignment.centerRight,
              child: SubmitButton(
                onSubmit: () => context
                    .read<TripCommentBloc>()
                    .add(TripCommentSubmitted(comment: _controller.text)),
                loading: state is TripCommentSubmitting,
              ),
            ),
          ),
      ],
    );
  }
}
