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
      Container(
        height: 300,
        color: context.colorScheme.background,
        child: DefaultTabController(
          length: 4,
          child: TabCardView(
            tabBarPadding: PaddingSmall.left(),
            tabs: ["first", "sec", "veryLongOne", "fouth"],
            children: [
              Center(child: Text("test")),
              Center(child: Text("test2")),
              Center(child: Text("test3")),
              Center(child: Text("test4")),
            ],
          ),
        ),
      ),
    ];
