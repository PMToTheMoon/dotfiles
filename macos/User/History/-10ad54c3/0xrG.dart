import 'package:common/common.dart';
import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

List<Widget> tabBars(BuildContext context) => [
      SizedBox(
        height: 300,
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: context.colorScheme.background,
                  child: TabCard(
                    margin: PaddingLarge(),
                    tabs: ["a", "b", "c"],
                    child: Column(
                      children: [
                        Container(
                          color: context.colorScheme.surfaceVariant,
                          child: TbtTabBar(
                            tabs: ["a", "b", "c"],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
