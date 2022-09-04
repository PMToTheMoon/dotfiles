import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:zanalys/patient/patient_list/patient_list_page.dart';
import 'package:zanalys/record/add_doctor/add_doctor_page.dart';
import 'package:zanalys/record/add_doctor/bloc/doctor_list_bloc.dart';
import 'package:zanalys/record/new_record/create_record_page/create_record_page.dart';
import 'package:zanalys/record/new_record/select_record_type/select_record_type_page.dart';

class NewRecordPage extends StatefulWidget {
  static NewRecordPage builder(BuildContext context) => const NewRecordPage();

  static MaterialPageRoute materialPageRoute() =>
      MaterialPageRoute(builder: builder);

  static Future<void> open(BuildContext context) => Navigator.of(context).push(
        materialPageRoute(),
      );

  const NewRecordPage({
    super.key,
  });

  @override
  State<NewRecordPage> createState() => _NewRecordPageState();
}

class _NewRecordPageState extends State<NewRecordPage> {

  Patient? patient;
  RecordType? recordType;
  Set<SelectedDoctor>? selectedDoctors;

  void _onPatientSelected(Patient p) {
    SelectRecordTypePage.open(
      context,
      patient: p,
      onTypeSelected: (t) => _onRecordTypeSelected(
        context,
        patient: p,
        type: t,
      ),
    );
  }

  void _onRecordTypeSelected() {
    AddDoctorPage.open(
      context,
      patient: patient,
      recordType: type,
      onDoctorsSelected: (_) => CreateRecordPage.open(context, patient: ),
    );
  }

  void _onDoctorSelected(
    
  )

  
  @override
  Widget build(BuildContext context) {
    return PatientListPage(
      onPatientSelected: (patient) => _onPatientSelected(context, patient),
    );
  }
}
