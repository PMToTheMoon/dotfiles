import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';

import 'package:tech_by_tech/candidate/profile/professional_experiences/professional_experiences.dart';
import 'package:translations/translations.dart';

import 'bloc/candidate_new_professional_experience_bloc.dart';
import 'new_professional_experience_consumer.dart';

class NewProfessionalExperienceCard extends StatefulWidget {
  const NewProfessionalExperienceCard({
    super.key,
  });

  @override
  State<NewProfessionalExperienceCard> createState() =>
      _NewProfessionalExperienceCardState();
}

class _NewProfessionalExperienceCardState
    extends State<NewProfessionalExperienceCard> {
  final _controller = ProfessionalExperienceFormController();

  void _onSubmitForm(BuildContext context) {
    if (_controller.validate()) {
      final snapshot = _controller.snapshot();
      context.read<CandidateNewProfessionalExperienceBloc>().add(
            CandidateNewProfessionalExperienceCreated(
              data: NewProfessionalExperience(
                title: snapshot.title,
                company: snapshot.company,
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
    return BlocProvider<CandidateNewProfessionalExperienceBloc>(
      create: (context) => CandidateNewProfessionalExperienceBloc(
        candidateRepository: context.read(),
      ),
      child: CandidateNewProfessionalExperienceBlocListener(
        onSuccess: (c, s) => _controller.formKey.currentState?.reset(),
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
                ProfessionalExperienceForm(
                  controller: _controller,
                ),
                const SpaceMedium.h(),
                BlocBuilder<CandidateNewProfessionalExperienceBloc,
                    CandidateNewProfessionalExperienceState>(
                  bloc: context.read(),
                  builder: (context, state) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.controller,
  });

  final ProfessionalExperienceFormController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onSubmitForm(context),
      child: Text(context.l10n.new_professional_experience_from_button),
    );
  }
}
