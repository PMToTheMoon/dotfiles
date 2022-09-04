import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

List<Widget> cards(BuildContext context) => [
      Row(children: [
        Card(
          child: Padding(
            padding: const PaddingSmaller(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.titleMedium('Titre de la carte'),
                const SpaceSmallest(),
                context.displayLarge('0'),
              ],
            ),
          ),
        ),
      ]),
    ];
