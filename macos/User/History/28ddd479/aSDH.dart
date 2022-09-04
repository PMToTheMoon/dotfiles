import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TbtDropdownFormField<T> extends StatelessWidget {
  const TbtDropdownFormField({
    super.key,
    this.value,
    required this.onChanged,
    required this.items,
  });

  final T? value;
  final ValueChanged<T?> onChanged;
  final List<DropdownMenuItem<T>> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        hoverColor: context.tbtColors.secondaryHover,
        focusColor: context.tbtColors.secondaryHover,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.tbtColors.secondaryHover,
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(
        Dimensions.borderRadiusMedium,
      ),
      items: items,
    );
  }
}
