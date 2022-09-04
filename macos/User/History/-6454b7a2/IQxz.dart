import 'package:flutter/material.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/widgets/professional_experience_form/professional_experience_form.dart';

class EditProfessionalExperienceForm extends StatelessWidget {
  const EditProfessionalExperienceForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ProfessionalExperienceForm(),
    ]);
  }
}
