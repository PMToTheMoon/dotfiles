import 'package:common/common.dart';
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
                    child: Center(
                      child: Text("CARD"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
