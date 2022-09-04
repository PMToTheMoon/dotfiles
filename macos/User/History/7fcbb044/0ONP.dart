import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:zanalys/patient/patient_list/patient_list_page.dart';

class NewRecordPage extends StatelessWidget {
  static NewRecordPage builder(BuildContext context) => const NewRecordPage();

  static MaterialPageRoute materialPageRoute() =>
      MaterialPageRoute(builder: builder);

  static Future<void> open(BuildContext context) => Navigator.of(context).push(
        materialPageRoute(),
      );

  const NewRecordPage({
    super.key,
  });

  void _onPatientSelected(Patient p) {}

  @override
  Widget build(BuildContext context) {
    return PatientListPage(onPatientSelected: _onPatientSelected);
  }
}
