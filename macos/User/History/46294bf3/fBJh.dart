import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'patient_list/patient_list_page.dart';

const _routes = {
  PatientListPage.route: PatientListPage.builder,
};

class PatientRoot extends StatelessWidget {
  const PatientRoot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NestedNavigator(
      initialRoute: ,
      routes: _routes,
    );
  }
}
