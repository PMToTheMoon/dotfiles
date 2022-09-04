import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> tabBars(BuildContext context) => [
      DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: 'first',
                ),
                Tab(
                  text: 'second',
                ),
                Tab(
                  text: 'third',
                ),
              ],
            )
          ],
        ),
        TabCard(
          tabs: ["a", "b", "c"],
          child: Center(
            child: Text("CARD"),
          ),
        ),
      )
    ];
