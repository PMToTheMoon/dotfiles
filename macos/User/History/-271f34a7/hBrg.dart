import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

PreferredSizeWidget authAppBar(BuildContext context) => AppBar(
      title: context.displayLarge('TechByTech'),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text("Nos service"),
        ),
      ],
    );
