import 'package:flutter/material.dart';

import 'patient_list/patient_list_page.dart';

class PatientRoot extends StatelessWidget {
  const PatientRoot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: PatientListPage.route,
      pages: [
        MaterialPage(
          name: PatientListPage.route,
          child: PatientListPage.builder(context),
        ),
      ],
    );
  }
}
