import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';

import 'package:translations/translations.dart';

import '../education_form/education_form.dart';
import 'bloc/candidate_new_education_bloc.dart';
import 'new_education_consumer.dart';

class NewEducationCard extends StatefulWidget {
  const NewEducationCard({
    super.key,
  });

  @override
  State<NewEducationCard> createState() => _NewEducationCardState();
}

class _NewEducationCardState extends State<NewEducationCard> {
  EducationFormController _controller = EducationFormController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CandidateNewEducationBloc>(
      create: (context) => CandidateNewEducationBloc(
        candidateRepository: context.read(),
      ),
      child: CandidateNewEducationBlocListener(
        onSuccess: (c, s) => setState(() {
          _controller = EducationFormController();
        }),
        onError: (c, s) => c.showErrorSnackBar(),
        child: TbtHoverCard(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Dimensions.paddingMedium,
              horizontal: Dimensions.paddingLarge,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.headlineMedium(
                    context.l10n.new_professional_experience_from_tile),
                const SpaceMedium.h(),
                EducationForm(
                  controller: _controller,
                ),
                const SpaceMedium.h(),
                _SubmitButton(_controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton(this._controller);

  final EducationFormController _controller;

  void _onSubmitForm(BuildContext context) {
    if (_controller.validate()) {
      final snapshot = _controller.snapshot();
      context.read<CandidateNewEducationBloc>().add(
            CandidateNewEducationCreated(
              data: NewEducation(
                title: snapshot.title,
                school: snapshot.school,
                location: snapshot.location,
                startDate: snapshot.startDate!,
                endDate: snapshot.ongoing == true ? null : snapshot.endDate,
                description: snapshot.description,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(
      (CandidateNewEducationBloc bloc) => bloc.state,
    );
    final isLoading = state is CandidateNewEducationLoading;
    return SubmitButton(
      loading: isLoading,
      onPressed: () => _onSubmitForm(context),
      child: Text(context.l10n.new_professional_experience_from_button),
    );
  }
}
