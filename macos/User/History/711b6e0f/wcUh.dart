import 'package:flutter/material.dart';

class BasicTextField extends StatefulWidget {
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
  State<BasicTextField> createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  TextEditingController? _controller;
  String? _text;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? "");
    _controller?.addListener(() {
      if (_text != _controller?.text) {
        widget.onChanged.call(_controller?.text);
      }
      _text = _controller?.text;
    });
  }

  @override
  void didUpdateWidget(covariant BasicTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      _controller?.text = widget.initialValue ?? "";
      _controller?.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller?.text.length ?? 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
        ),
        initialValue: initialValue,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        style: const TextStyle(fontSize: 14),
        textInputAction: textInputAction,
        controller: _controller,
        onFieldSubmitted: widget.onSubmitted,
        textInputAction: widget.textInputAction,
      ),
    );
  }
}
