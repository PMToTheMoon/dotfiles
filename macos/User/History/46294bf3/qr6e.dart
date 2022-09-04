import 'package:flutter/material.dart';

import 'patient_list/patient_list_page.dart';

const _routes = {
  PatientListPage.route: PatientListPage.builder,
};

class PatientRoot extends StatefulWidget {
  const PatientRoot({
    super.key,
  });

  @override
  State<PatientRoot> createState() => _PatientRootState();
}

class _PatientRootState extends State<PatientRoot> {
  final navigatorKey = GlobalKey<NavigatorState>();

  Future<bool> _onWillPop() async {
    if (navigatorKey.currentState?.canPop() == true) {
      navigatorKey.currentState?.pop();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Navigator(
        key: navigatorKey,
        initialRoute: PatientListPage.route,
        onGenerateRoute: (RouteSettings settings) {
          final builder = _routes[settings.name];
          if (builder != null) {
            return MaterialPageRoute<void>(
                builder: builder, settings: settings);
          }
          throw Exception('Invalid route: ${settings.name}');
        },
      ),
    );
  }
}
