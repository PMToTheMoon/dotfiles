import 'package:flutter/material.dart';

class TbtDropdownDormField extends StatelessWidget {
  const TbtDropdownDormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: 0,
      onChanged: (_) {},
      // focusColor: context.tbtColors.secondaryHover,
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
      items: [
        DropdownMenuItem(
          child: Text("test"),
          value: 0,
        ),
        DropdownMenuItem(
          child: Text("test"),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text("test"),
          value: 2,
        ),
      ],
    );
  }
}
