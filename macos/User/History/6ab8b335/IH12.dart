import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// Root page for all page accessible via bottom bar
class HubPage extends StatefulWidget {
  static const route = 'hub';

  static HubPage builder(BuildContext context) => const HubPage();

  const HubPage({
    Key? key,
  }) : super(key: key);

  @override
  _HubPageState createState() => _HubPageState();
}

class _HubPageState extends State<HubPage> {
  _HubPageState();

  ZanalysBottomNavigationTab currentTab = ZanalysBottomNavigationTab.home;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: PageView(),
        ),
        ZanalysBottomNavigationBar(
          currentTab: currentTab,
          onSelected: (selected) => setState(() {
            currentTab = selected;
          }),
        ),
      ],
    );
  }
}
