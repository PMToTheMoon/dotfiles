import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

PreferredSizeWidget authAppBar(BuildContext context) => AppBar(
      centerTitle: false,
      title: context.displayMedium('TechByTech'),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text("Nos service"),
        ),
      ],
    );
