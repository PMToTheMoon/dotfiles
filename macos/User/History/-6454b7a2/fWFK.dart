import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/widgets/professional_experience_card/bloc/candidate_edit_professional_experience_bloc.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/widgets/professional_experience_form/professional_experience_form.dart';

class EditProfessionalExperienceView extends StatefulWidget {
  const EditProfessionalExperienceView({
    super.key,
    required this.experience,
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
    title: widget.experience.title,
    company: widget.experience.company,
    location: widget.experience.location,
    startDate: widget.experience.startDate,
    endDate: widget.experience.endDate,
    ongoing: widget.experience.endDate == null,
    description: widget.experience.description,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CandidateEditProfessionalExperienceBloc>(
      create: (context) => CandidateEditProfessionalExperienceBloc(
          candidateRepository: context.read()),
      child: Column(children: [
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
      ]),
    );
  }
}
