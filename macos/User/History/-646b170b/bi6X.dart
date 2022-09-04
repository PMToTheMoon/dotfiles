import 'package:flutter/material.dart';
import 'package:zanalys/utils/size_utils.dart';

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
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          counterText: '',
          contentPadding: EdgeInsets.only(
            left: 3.realWidth(context),
            top: 16.realHeight(context),
          ),
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        style: TextStyle(fontSize: 22.sp(context), fontWeight: FontWeight.w600),
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
