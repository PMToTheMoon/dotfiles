import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/bloc/candidate_professional_experiences_bloc.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/new_professional_experience_card/bloc/candidate_new_professional_experience_bloc.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/new_professional_experience_card/new_professional_experience_consumer.dart';
import 'package:tech_by_tech/candidate/profile/professional_experiences/widgets/professional_experience_form/professional_experience_form.dart';
import 'package:translations/translations.dart';

import '../widgets/professional_experience_form/professional_experience_form_controller.dart';

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

  void _onSubmitForm() {
    if (_controller.validate()) {
      final snapshot = _controller.snapshot();
      context.read<CandidateNewProfessionalExperienceBloc>().add(
            CandidateNewProfessionalExperienceCreated(
              data: NewProfessionalExperience(
                title: snapshot.title,
                company: snapshot.company,
                location: snapshot.location,
                beginDate: snapshot.startDate!,
                endDate: snapshot.ongoing == true ? null : snapshot.endDate,
                description: snapshot.description,
              ),
            ),
          );
    }
  }

  Widget _buildSubmitButton(
    BuildContext context,
  ) =>
      ElevatedButton(
          onPressed: _onSubmitForm,
          child: Text(context.l10n.new_professional_experience_from_button));

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CandidateNewProfessionalExperienceBloc>(
      create: (context) => CandidateNewProfessionalExperienceBloc(
        candidateRepository: context.read(),
      ),
      child: CandidateNewProfessionalExperienceBlocListener(
        onSuccess: (c, s) => _controller.formKey.currentState?.reset(),
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
                CandidateNewProfessionalExperienceBlocBuilder(
                  idle: (context, state) => _buildSubmitButton(),
                  loading: (context, state) => _buildLoadingSubmitButton(),
                  success: (context, state) => _buildSubmitButton(),
                  error: (context, state) => _buildSubmitButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubmitLoadingButton extends StatelessWidget {
  const _SubmitLoadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: null,
      child: ButtonLoadingIndicator(),
    );
  }
}
