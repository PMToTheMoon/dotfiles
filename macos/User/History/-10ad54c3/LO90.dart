import 'package:flutter/material.dart';

List<Widget> tabBars(BuildContext context) => [
      DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TaîBar(tabs: [
                Tab(
                  text: 'first',

                ),
              ])
            ],
          ))
    ];
