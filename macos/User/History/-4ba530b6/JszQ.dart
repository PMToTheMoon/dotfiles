import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

import 'bloc/candidate_skill_list_bloc.dart';

class CandidateSkillListView extends StatelessWidget {
  const CandidateSkillListView({
    super.key,
  });

  void _onStateChanged(BuildContext context, CandidateSkillListState state) {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CandidateSkillListBloc(
        candidateRepository: context.read(),
      )..add(const CandidateSkillListEvent.started()),
      child: BlocConsumer<CandidateSkillListBloc, CandidateSkillListState>(
        listener: _onStateChanged,
        builder: (context, CandidateSkillListState state) =>
            _ListBody(state: state),
      ),
    );
  }
}

class _ListBody extends StatelessWidget {
  const _ListBody({
    required this.state,
  });

  final CandidateSkillListState state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) return const LoadingIndicator();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ListTitle(skillNumber: state.skills.length),
        const SpaceSmaller.h(),
        if (state.skills.isEmpty) const _EmptyList(),
        if (state.skills.isNotEmpty)
          Wrap(
            spacing: Dimensions.paddingSmaller,
            runSpacing: Dimensions.paddingSmallest,
            children: state.skills
                .map((skill) =>
                    _SkillChip(skill, state.pendingDeletions.contains(skill)))
                .toList(),
          ),
      ],
    );
  }
}

class _EmptyList extends StatelessWidget {
  const _EmptyList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium)),
      padding: const PaddingLarge(),
      child: context.bodySmall(
        "Aucune compétence n’est ajoutée dans votre profile. Cliquez sur la barre de recherche pour chercher puis ajouter une compétence.",
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _ListTitle extends StatelessWidget {
  const _ListTitle({
    required this.skillNumber,
  });

  final int skillNumber;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.textTheme.headlineSmall,
        text: context.l10n.candidate_skills_list_skill_number_prefix,
        children: [
          const TextSpan(text: ' '),
          TextSpan(
              text:
                  context.l10n.candidate_skills_list_skill_number(skillNumber),
              style: TextStyle(
                color: context.tbtColors.secondary,
              )),
          const TextSpan(text: ' '),
          TextSpan(
            text: context.l10n.candidate_skills_list_skill_number_suffix,
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip(this.skill, this.deletionPending);

  final String skill;
  final bool deletionPending;

  @override
  Widget build(BuildContext context) {
    Widget? icon;
    if (deletionPending) {
      icon = const SizedBox.square(
        dimension: Dimensions.iconSmall,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }
    return InputChip(
      label: Text(skill),
      deleteIcon: icon,
      onDeleted: () => context.read<CandidateSkillListBloc>()
        ..add(CandidateSkillListEvent.skillDeleted(skill: skill)),
    );
  }
}
