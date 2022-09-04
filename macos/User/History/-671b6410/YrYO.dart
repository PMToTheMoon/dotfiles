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
        side: BorderSide(color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
        child: Padding(
          padding: const PaddingMedium(),
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
      TbtHoverCard(
        child: Padding(
          padding: const PaddingMedium(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.titleMedium('Titre de la carte'),
              const SpaceSmallest(),
              context.bodyMedium('lorem ipsum'),
              TbtTextField(),
            ],
          ),
        ),
      ),
    ];
