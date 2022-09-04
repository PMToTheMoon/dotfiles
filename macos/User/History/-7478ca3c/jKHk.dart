import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:translations/translations.dart';

import '../education_form/education_form.dart';
import '../education_form/education_form_controller.dart';
import 'bloc/candidate_edit_education_bloc.dart';

class EditEducationView extends StatefulWidget {
  const EditEducationView({
    super.key,
    required this.education,
    required this.onCancel,
    required this.onSuccess,
  });

  final Education education;
  final VoidCallback onCancel;
  final VoidCallback onSuccess;

  @override
  State<EditEducationView> createState() => _EditEducationViewState();
}

class _EditEducationViewState extends State<EditEducationView> {
  late final _controller = EducationFormController(
    title: widget.education.title,
    school: widget.education.school,
    location: widget.education.location,
    startDate: widget.education.startDate,
    endDate: widget.education.endDate,
    ongoing: widget.education.endDate == null,
    description: widget.education.description,
  );

  void _onStateChanged(
    BuildContext context,
    CandidateEditEducationState state,
  ) {
    state.mapOrNull(
      success: (s) => widget.onSuccess(),
      error: (s) => context.showErrorSnackBar(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CandidateEditEducationBloc>(
      create: (context) =>
          CandidateEditEducationBloc(candidateRepository: context.read()),
      child:
          BlocListener<CandidateEditEducationBloc, CandidateEditEducationState>(
        listener: _onStateChanged,
        child: Column(children: [
          EducationForm(
            controller: _controller,
          ),
          const SpaceSmall.h(),
          Row(
            children: [
              _SubmitButton(_controller, widget.education.id),
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
  const _SubmitButton(this._controller, this.educationId);

  final EducationFormController _controller;
  final String educationId;

  void _onSubmit(BuildContext context) {
    if (_controller.validate()) {
      final snapshot = _controller.snapshot();
      context.read<CandidateEditEducationBloc>().add(
            CandidateEditEducationUpdated(
              data: EducationUpdate(
                id: educationId,
                title: snapshot.title,
                school: snapshot.school,
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
      (CandidateEditEducationBloc bloc) => bloc.state,
    );
    final isLoading = state is CandidateEditEducationLoading;
    return SubmitButton(
      loading: isLoading,
      onPressed: () => _onSubmit(context),
      child: Text(context.l10n.edit_professional_education_from_button),
    );
  }
}
