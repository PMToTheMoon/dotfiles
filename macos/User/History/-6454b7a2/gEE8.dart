import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/widgets/professional_experience_form/professional_experience_form.dart';

class EditProfessionalExperienceView extends StatefulWidget {
  const EditProfessionalExperienceView({
    super.key,
    required this.onCancel,
    required this.onSuccess,
  });

  final ProfessionalExperience experience;
  final VoidCallback onCancel;
  final VoidCallback onSuccess;

  @override
  State<EditProfessionalExperienceView> createState() =>
      _EditProfessionalExperienceViewState();
}

class _EditProfessionalExperienceViewState
    extends State<EditProfessionalExperienceView> {
  late final _controller = ProfessionalExperienceFormController(
    title: widget.experience,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ProfessionalExperienceForm(
        controller: _controller,
      ),
      Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("ok"),
          ),
          OutlinedButton(
            onPressed: widget.onCancel,
            child: Text("Cancle"),
          ),
        ],
      )
    ]);
  }
}
