import 'package:zanalys/patient/patient_list/patient_list_page.dart';

class NewRecordPage extends StatelessWidget {
  const NewRecordPage({
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return PatientListPage(onPatientSelected: onPatientSelected)
  }
}