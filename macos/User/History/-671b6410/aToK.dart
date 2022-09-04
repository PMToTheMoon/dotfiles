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
      const SpaceSmall(),
      BorderCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.titleMedium('Titre de la carte'),
              const SpaceSmallest(),
              context.bodyMedium('lorem ipsum'),
            ],
          ),
        ),
      ),
    ];
