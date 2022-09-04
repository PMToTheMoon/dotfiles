import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/hub/hub.dart';
import 'package:zanalys/hub/patient_list/patient_list_page.dart';
import 'package:zanalys/user/user_service.dart';

import 'home/home_page.dart';
import 'home/records/bloc/home_records_bloc.dart';
import 'patient_list/bloc/patient_list_bloc.dart';

const _kInitialPage = ZanalysBottomNavigationTab.home;

const _pages = {
  ZanalysBottomNavigationTab.home: HomePage(),
  ZanalysBottomNavigationTab.patients: PatientListPage(),
  ZanalysBottomNavigationTab.picture: PicturePage(),
};

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PatientListBloc(
            userService: GetIt.I.get(),
          )..add(const PatientListFetchRequested(filter: '')),
        )
      ],
      child: DecoratedBox(
        decoration: BoxDecoration(color: context.colorScheme.background),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: IndexedStack(
                index: currentTab.index,
                children: const [
                  HomePage(),
                  PatientListPage(),
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
      ),
    );
  }
}
