import 'package:flutter/material.dart';

import 'form_form_snapshot.dart';

part 'form_form_controller.dart';

class FormForm extends StatefulWidget {
  const FormForm({
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

  final FormFormController? controller;

  @override
  FormFormState createState() => FormFormState();
}

class FormFormState extends State<FormForm> {
  FormFormState();

  late final _controller = widget.controller ?? FormFormController();

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
              controller: _controller.name.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(errorMaxLines: 3))
        ],
      ),
    );
  }
}
