import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/widgets/professional_experience_card/bloc/candidate_edit_professional_experience_bloc.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/widgets/professional_experience_form/professional_experience_form.dart';
import 'package:translations/translations.dart';

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

  void _onStateChanged(
    BuildContext context,
    CandidateEditProfessionalExperienceState state,
  ) {
    state.mapOrNull(
      success: (s) => widget.onSuccess(),
      error: (s) => context.showErrorSnackBar(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CandidateEditProfessionalExperienceBloc>(
      create: (context) => CandidateEditProfessionalExperienceBloc(
          candidateRepository: context.read()),
      child: BlocListener<CandidateEditProfessionalExperienceBloc,
          CandidateEditProfessionalExperienceState>(
        listener: _onStateChanged,
        child: Column(children: [
          ProfessionalExperienceForm(
            controller: _controller,
          ),
          const SpaceSmall.h(),
          Row(
            children: [
              _SubmitButton(_controller, widget.experience.id),
              const SpaceSmall.w(),
              OutlinedButton(
                onPressed: widget.onCancel,
                child: Text(context.l10n.cancel),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton(this._controller, this.experienceId);

  final ProfessionalExperienceFormController _controller;
  final String experienceId;

  void _onSubmit(BuildContext context) {
    if (_controller.validate()) {
      final snapshot = _controller.snapshot();
      context.read<CandidateEditProfessionalExperienceBloc>().add(
            CandidateEditProfessionalExperienceUpdated(
              data: ProfessionalExperienceUpdate(
                id: experienceId,
                title: snapshot.title,
                company: snapshot.company,
                location: snapshot.location,
                startDate: snapshot.startDate,
                endDate: snapshot.ongoing == false ? snapshot.endDate : null,
                description: snapshot.description,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(
      (CandidateEditProfessionalExperienceBloc bloc) => bloc.state,
    );
    final isLoading = state is CandidateEditProfessionalExperienceLoading;
    return SubmitButton(
      loading: isLoading,
      onPressed: () => _onSubmit(context),
      child: Text(context.l10n.edit_professional_experience_from_button),
    );
  }
}
