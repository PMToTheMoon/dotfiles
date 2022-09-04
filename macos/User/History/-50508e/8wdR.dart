import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/hub/hub.dart';
import 'package:zanalys/hub/patient_list/patient_list_page.dart';
import 'package:zanalys/patient/patient_root.dart';

import 'home/home_page.dart';

const _kInitialPage = ZanalysBottomNavigationTab.patients;

/// Root page for all page accessible via bottom bar
class HubPage extends StatefulWidget {
  static const route = 'hub';

  static HubPage builder(BuildContext context) => const HubPage();

  const HubPage({
    Key? key,
  }) : super(key: key);

  @override
  HubPageState createState() => HubPageState();
}

class HubPageState extends State<HubPage> {
  HubPageState();

  ZanalysBottomNavigationTab currentTab = _kInitialPage;

  void _onBottomTabSelected(ZanalysBottomNavigationTab tab) {
    setState(() {
      currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.colorScheme.background),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: currentTab.index,
              children: const [
                HomePage(),
                PatientRoot(),
                PicturePage(),
              ],
            ),
          ),
          ZanalysBottomNavigationBar(
            currentTab: currentTab,
            onSelected: _onBottomTabSelected,
          ),
        ],
      ),
    );
  }
}
