import 'package:flutter/material.dart';

List<Widget> tabBars(BuildContext context) => [
      DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(tabs: [
                Tab(
                  text: 'first',
                ),
              ])
            ],
          ))
    ];
