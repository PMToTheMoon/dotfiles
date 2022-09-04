import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

List<Widget> cards(BuildContext context) => [
      Row(children: [
        Card(
          child: Padding(
            padding: const PaddingSmall(),
            child: Column(
              children: [
                context.titleMedium('Titre de la carte'),
                context.displayLarge('0'),
              ],
            ),
          ),
        ),
      ]),
    ];
