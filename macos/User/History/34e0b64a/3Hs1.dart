import 'package:flutter/material.dart';
import 'package:common/common.dart';
part 'general_initial_observation_form_snapshot.dart';
part 'general_initial_observation_form_controller.dart';

class GeneralInitialObservationForm extends StatefulWidget {
  const GeneralInitialObservationForm({
    this.onWillPop,
    this.onChanged,
    this.autovalidateMode,
    Widget? spacing,
    super.key,
  }) : spacing = spacing ?? const SizedBox(height: 12);

  final WillPopCallback? onWillPop;

  final VoidCallback? onChanged;

  final AutovalidateMode? autovalidateMode;

  final Widget spacing;

  @override
  GeneralInitialObservationFormState createState() =>
      GeneralInitialObservationFormState();
}

class GeneralInitialObservationFormState
    extends State<GeneralInitialObservationForm> {
  GeneralInitialObservationFormState();

  final _controller = GeneralInitialObservationFormController();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      onWillPop: widget.onWillPop,
      autovalidateMode: widget.autovalidateMode,
      key: _controller._formKey,
      child: Column(
        children: [
          FormSection(
            title: 'context.l10n.record_title',
            required: false,
            children: [
              TextFormField(
                controller: _controller.title,
                decoration:
                    InputDecoration(labelText: context.l10n.record_title_hint),
              )
            ],
          ),
          widget.spacing,
          FormSection(
            title: 'context.l10n.hidden_reason_title',
            required: false,
            children: [
              MultiLineTextFormField(
                controller: _controller.hidden_reason,
                hint: context.l10n.hidden_reason_hint,
              )
            ],
          )
        ],
      ),
    );
  }
}
