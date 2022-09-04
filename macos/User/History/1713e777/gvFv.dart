import 'package:flutter/material.dart';
import 'package:zanalys/resources/app_colors.dart';

class ColorButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;

  const ColorButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.textColor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = color ?? AppColors.primary;
    Color realTextColor = textColor ?? Colors.white;

    const double height = 39;
    const double width = 228;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(width, height),
        primary: buttonColor == Colors.white ? Colors.grey : Colors.white,
        backgroundColor:
            onPressed != null ? buttonColor : buttonColor.withOpacity(0.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: realTextColor,
        ),
      ),
    );
  }
}
