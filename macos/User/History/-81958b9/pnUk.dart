import 'package:flutter/material.dart';
import 'package:common/common.dart';
part 'observation_form_snapshot.dart';
part 'observation_form_controller.dart';

class ObservationForm extends StatefulWidget {
  const ObservationForm({
    this.onWillPop,
    this.onChanged,
    this.autovalidateMode,
    double? spacing,
    super.key,
  }) : spacing = spacing ?? 0;

  final WillPopCallback? onWillPop;

  final VoidCallback? onChanged;

  final AutovalidateMode? autovalidateMode;

  final double spacing;

  @override
  ObservationFormState createState() => ObservationFormState();
}

class ObservationFormState extends State<ObservationForm> {
  ObservationFormState();

  final _controller = ObservationFormController();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      onWillPop: widget.onWillPop,
      autovalidateMode: widget.autovalidateMode,
      key: _controller._formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _controller.name,
          ),
          const SizedBox(height: spacing),
          TextFormField(
            controller: _controller.lastName,
            decoration: InputDecoration(labelText: context.l10n.x),
          )
        ],
      ),
    );
  }
}
