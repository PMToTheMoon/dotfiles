import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:zanalys/patient/patient_list/patient_list_page.dart';

class NewRecordPage extends StatelessWidget {
  const NewRecordPage({
    super.key,
  });

  void _onPatientSelected(Patient p) {}

  @override
  Widget build(BuildContext context) {
    return PatientListPage(onPatientSelected: _onPatientSelected);
  }
}
