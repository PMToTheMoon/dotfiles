import 'package:flutter/material.dart';

class OTPTextField extends StatelessWidget {
  final int index;
  final bool isLast;
  final ValueChanged onChanged;
  final ValueChanged? onSubmitted;

  const OTPTextField(
      {Key? key,
      required this.index,
      required this.isLast,
      required this.onChanged,
      this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
          contentPadding: EdgeInsets.only(
            left: 3,
            top: 16,
          ),
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
        maxLength: 1,
        maxLines: 1,
        keyboardType: TextInputType.number,
        showCursor: false,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
      ),
    );
  }
}
