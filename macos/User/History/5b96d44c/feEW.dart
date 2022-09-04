import 'dart:ui';

import 'package:flutter/material.dart';

class ObservationFormSnapshot {
  const ObservationFormSnapshot({
    this.textField,
  });

  final String? textField;
}

class ObservationFormController {
  ObservationFormController([
    ObservationFormSnapshot? initialValue,
  ]) : textFieldController =
            TextEditingController(text: initialValue?.textField);

  final _formKey = GlobalKey<FormFieldState>();

  // controlled
  final TextEditingController textFieldController;

  // uncontrolled ?

  ObservationFormSnapshot snapshot() => const ObservationFormSnapshot();
  bool validate() => true;
}

class ObservationForm extends StatefulWidget {
  const ObservationForm({
    this.onWillPop,
    this.onChanged,
    this.autovalidateMode,
    super.key,
  });

  final WillPopCallback? onWillPop;

  /// Called when one of the form fields changes.
  ///
  /// In addition to this callback being invoked, all the form fields themselves
  /// will rebuild.
  final VoidCallback? onChanged;

  /// Used to enable/disable form fields auto validation and update their error
  /// text.
  ///
  /// {@macro flutter.widgets.FormField.autovalidateMode}
  final AutovalidateMode? autovalidateMode;

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
            decoration: InputDecoration(
              labelText: "a",
              hintText: "a",
            ),
            controller: _controller.textFieldController,
            // validator: ,
          )
        ],
      ),
    );
  }
}
