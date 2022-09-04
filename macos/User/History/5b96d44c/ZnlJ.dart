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
    super.key,
  });

  @override
  ObservationFormState createState() => ObservationFormState();
}

class ObservationFormState extends State<ObservationForm> {
  ObservationFormState();

  final _controller = ObservationFormController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller._formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _controller.textFieldController,
          )
        ],
      ),
    );
  }
}
