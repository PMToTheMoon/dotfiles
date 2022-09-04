import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:zanalys/patient/patient_list/patient_list_page.dart';
import 'package:zanalys/record/new_record/select_record_type/select_record_type_page.dart';

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

  void _onPatientSelected(BuildContext context, Patient p) {
    SelectRecordTypePage.open(context);
  }

  @override
  Widget build(BuildContext context) {
    return PatientListPage(
      onPatientSelected: (patient) => _onPatientSelected(context, patient),
    );
  }
}
