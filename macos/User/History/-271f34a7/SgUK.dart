import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

PreferredSizeWidget authAppBar(BuildContext context) => AppBar(
      centerTitle: false,
      elevation: 0,
      title: Padding(
        padding: const PaddingLarger(left),
        child: context.displayMedium('TechByTech'),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text("Nos service"),
        ),
      ],
    );
