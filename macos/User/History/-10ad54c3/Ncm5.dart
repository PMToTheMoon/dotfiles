import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> tabBars(BuildContext context) => [
      SizedBox(
        height: 300,
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: const [
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
              ),
              Expanded(
                child: TabCard(
                  tabs: ["a", "b", "c"],
                  child: Center(
                    child: Text("CARD"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
