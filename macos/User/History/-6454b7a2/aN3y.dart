import 'package:flutter/material.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/widgets/professional_experience_form/professional_experience_form.dart';

class EditProfessionalExperienceView extends StatelessWidget {
  const EditProfessionalExperienceView({
    super.key,
    required this.onCancel,
    required this.onSuccess,
  });

  final VoidCallback onCancel;
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ProfessionalExperienceForm(),
      Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("ok"),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text("Cancle"),
          ),
        ],
      )
    ]);
  }
}
