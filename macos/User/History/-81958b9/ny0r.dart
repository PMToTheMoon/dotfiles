import 'package:flutter/material.dart';
part 'observation_form_controller.dart';
part 'observation_form_snapshot.dart';

class ObservationForm extends StatefulWidget {
  const ObservationForm({
    this.onWillPop,
    this.onChanged,
    this.autovalidateMode,
    Widget? spacing,
    this.controller,
    super.key,
  }) : spacing = spacing ?? const SizedBox.shrink();

  final WillPopCallback? onWillPop;

  final VoidCallback? onChanged;

  final AutovalidateMode? autovalidateMode;

  final Widget spacing;

  final GeneralInitialObservationFormController? controller;

  @override
  ObservationFormState createState() => ObservationFormState();
}

class ObservationFormState extends State<ObservationForm> {
  ObservationFormState();

  late final _controller = widget.controller ?? ObservationFormController();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      onWillPop: widget.onWillPop,
      autovalidateMode: widget.autovalidateMode,
      key: _controller._formKey,
      child: Column(
        children: [
          ...[
            TextFormField(
                controller: _controller.name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(errorMaxLines: 3)),
            widget.spacing,
            TextFormField(
                controller: _controller.lastName,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    errorMaxLines: 3, labelText: 'context.l10n.x '))
          ]
        ],
      ),
    );
  }
}
