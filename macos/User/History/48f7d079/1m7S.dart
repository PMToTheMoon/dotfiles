import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final ValueChanged onChanged;
  final ValueChanged? onSubmitted;
  final TextInputAction? textInputAction;

  const BasicTextField(
      {Key? key,
      required this.labelText,
      required this.onChanged,
      this.onSubmitted,
      this.textInputAction,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        initialValue: initialValue,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        style: TextStyle(fontSize: 14.sp(context)),
        textInputAction: textInputAction,
      ),
    );
  }
}
