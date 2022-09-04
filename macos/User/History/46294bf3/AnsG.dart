import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import 'patient_list/patient_list_page.dart';
import 'patient_view/patient_view_page.dart';

// const _initialRoute = PatientListPage.route;

// const _routes = {
//   PatientListPage.route: PatientListPage.builder,
// };

class PatientRoot extends StatefulWidget {
  const PatientRoot({
    super.key,
  });

  @override
  State<PatientRoot> createState() => _PatientRootState();
}

class _PatientRootState extends State<PatientRoot> {
  final _navigator = GlobalKey<NavigatorState>();

  void _onPatientSelected(Patient p) {
    _navigator.currentState?.push(
      PatientPage.materialPageRoute(patient: p),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedNavigator(
      navigatorKey: _navigator,
      home: PatientListPage(
        onPatientSelected: (patient) => _onPatientSelected(patient),
      ),
    );
  }
}
