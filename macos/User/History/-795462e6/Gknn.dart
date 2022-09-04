import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({
    this.onWillPop,
    this.onChanged,
    this.autovalidateMode,
    super.key,
  });

  final WillPopCallback? onWillPop;

  final VoidCallback? onChanged;

  final AutovalidateMode? autovalidateMode;

  @override
  ObservationFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  MyFormState();

  final _controller = MyFormController();

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
            controller: _controller.nameController,
          ),
          TextFormField(
            controller: _controller.lastNameController,
            decoration: InputDecoration(labelText: Test),
          ),
        ],
      ),
    );
  }
}
