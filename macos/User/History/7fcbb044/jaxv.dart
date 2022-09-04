import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:zanalys/patient/patient_list/patient_list_page.dart';

class NewRecordPage extends StatelessWidget {
  static Widget builder(BuildContext context) => const NewRecordPage();

  const NewRecordPage({
    super.key,
  });

  void _onPatientSelected(Patient p) {}

  @override
  Widget build(BuildContext context) {
    return PatientListPage(onPatientSelected: _onPatientSelected);
  }
}
