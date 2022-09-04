part of 'reservation_form.dart';

const double _iconSize = Dimensions.icon2;

class CommandConfirmationDialog extends StatefulWidget {
  const CommandConfirmationDialog({
    required this.userInfos,
    required this.reservation,
    required this.onAccept,
    Key? key,
  }) : super(key: key);

  final UserInfos userInfos;
  final EstimatedReservation reservation;
  final void Function(String comment) onAccept;

  @override
  _CommandConfirmationDialogState createState() =>
      _CommandConfirmationDialogState();
}

class _CommandConfirmationDialogState extends State<CommandConfirmationDialog> {
  _CommandConfirmationDialogState();

  final TextEditingController _comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _comment.dispose();
  }

  String get passenger {
    final _passenger = widget.reservation.passenger;
    if (_passenger == null) {
      return "${widget.userInfos.firstName} ${widget.userInfos.lastName}";
    } else {
      return "${_passenger.firstName} ${_passenger.lastName}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      scrollable: true,
      title: Text(
        context.l10n.command_confirmation_dialog_title,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DialogItem(
            icon: const Icon(
              Icons.date_range,
              size: _iconSize,
            ),
            text: DateFormat.yMMMd(context.l10n.localeName)
                .add_jm()
                .format(widget.reservation.date),
          ),
          const Space4(),
          _DialogItem(
            icon: Assets.images.departure.image(
              height: _iconSize,
              width: _iconSize,
            ),
            text: widget.reservation.departure.label,
          ),
          const Space4(),
          _DialogItem(
            icon: Assets.images.arrival.image(
              height: _iconSize,
              width: _iconSize,
            ),
            text: widget.reservation.arrival.label,
          ),
          const Space4(),
          _DialogItem(
            icon: widget.reservation.vehicle.assetBlack.image(
              height: _iconSize,
              width: _iconSize,
            ),
            text: widget.reservation.vehicle.displayName(context),
          ),
          const Space4(),
          Row(
            children: [
              const Icon(Icons.person),
              const Space5.w(),
              Text(passenger),
            ],
          ),
          const Space4(),
          Row(
            children: [
              Icon(widget.reservation.paymentMethod.icon),
              const Space5.w(),
              Text(widget.reservation.paymentMethod.displayName(context)),
            ],
          ),
          const Space4(),
          Button.menu(
            "Ajouter un commentaire",
            () {},
            color: context.colorScheme.tertiary,
          ),
          _CommentField(controller: _comment),
          const Space4(),
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.command_confirmation_term_payment,
                ),
              ),
              const Space4.w(),
              _buildPrice(context),
            ],
          ),
        ],
      ),
      actions: [
        Button.primary(
          context.l10n.command_confirmation_dialog_action,
          () => widget.onAccept(_comment.text),
        ),
      ],
    );
  }

  Widget _buildPrice(BuildContext context) {
    final amount = widget.reservation.estimate.price.toStringAsFixed(2);
    final currency = widget.reservation.estimate.currency;
    return Text.rich(
      TextSpan(
        text: "$amount ",
        style: context.textTheme.subtitle2,
        children: [
          TextSpan(
            text: currency,
            style: context.textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

class _DialogItem extends StatelessWidget {
  const _DialogItem({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const Space4.w(),
        Expanded(child: Text(text)),
      ],
    );
  }
}

/// A widget that ensures it is always visible when focused.
class _CommentField extends StatefulWidget {
  const _CommentField({
    Key? key,
    required this.controller,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 100),
  }) : super(key: key);

  final TextEditingController controller;

  /// The curve we will use to scroll ourselves into view.
  ///
  /// Defaults to Curves.ease.
  final Curve curve;

  /// The duration we will use to scroll ourselves into view
  ///
  /// Defaults to 100 milliseconds.
  final Duration duration;

  @override
  _CommentFieldState createState() => _CommentFieldState();
}

class _CommentFieldState extends State<_CommentField> {
  final _focusNode = FocusNode();
  int _maxLines = 1;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_ensureVisible);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_ensureVisible);
    _focusNode.dispose();
  }

  Future<void> _ensureVisible() async {
    if (!_focusNode.hasFocus) {
      setState(() {
        _maxLines = 1;
      });
      return;
    }

    setState(() {
      _maxLines = 3;
    });
    // Wait for the keyboard to come into view
    // TODO: position doesn't seem to notify listeners when metrics change,
    // perhaps a NotificationListener around the scrollable could avoid
    // the need insert a delay here.
    await Future.delayed(const Duration(milliseconds: 600));

    final RenderObject? object = context.findRenderObject();
    if (object == null) return;

    final RenderAbstractViewport? viewport = RenderAbstractViewport.of(object);
    if (viewport == null) return;

    final ScrollableState? scrollableState = Scrollable.of(context);
    if (scrollableState == null) return;

    ScrollPosition position = scrollableState.position;
    double alignment;
    if (position.pixels > viewport.getOffsetToReveal(object, 0.0).offset) {
      // Move down to the top of the viewport
      alignment = 0.0;
    } else if (position.pixels <
        viewport.getOffsetToReveal(object, 1.0).offset) {
      // Move up to the bottom of the viewport
      alignment = 1.0;
    } else {
      // No scrolling is necessary to reveal the child
      return;
    }
    position.ensureVisible(
      object,
      alignment: alignment,
      duration: widget.duration,
      curve: widget.curve,
    );
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        decoration: const InputDecoration(hintText: "Ajouter un commentaire"),
        maxLength: 256,
        maxLines: _maxLines,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
      );
}
