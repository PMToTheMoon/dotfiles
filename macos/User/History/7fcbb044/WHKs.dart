import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:zanalys/patient/patient_list/patient_list_page.dart';
import 'package:zanalys/record/add_doctor/add_doctor_page.dart';
import 'package:zanalys/record/add_doctor/bloc/doctor_list_bloc.dart';
import 'package:zanalys/record/hub/hub.dart';
import 'package:zanalys/record/new_record/create_record_page/create_record_page.dart';
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

  void _onRecordTypeSelected(
    BuildContext context, {
    required Patient patient,
    required RecordType type,
  }) {
    AddDoctorPage.open(
      context,
      patient: patient,
      recordType: type,
      onDoctorsSelected: (doctors) => _onDoctorSelected(
        context,
        patient: patient,
        recordType: type,
        doctors: doctors,
      ),
    );
  }

  void _onDoctorSelected(
    BuildContext context, {
    required Patient patient,
    required RecordType recordType,
    required Set<SelectedDoctor> doctors,
  }) {
    CreateRecordPage.open(
      context,
      patient: patient,
      doctors: doctors,
      recordType: recordType,
      onError: () {
        Navigator.of(context).pop();
        context.showErrorSnackBar();
      },
      onRecordCreated: (recordId) {
        Navigator.of(context).pushAndRemoveUntil(
          HubPage.materialPageRoute(
            recordId: recordId,
          ),
          (route) => route.isFirst,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PatientListPage(
      onPatientSelected: (patient) => _onPatientSelected(context, patient),
    );
  }
}
