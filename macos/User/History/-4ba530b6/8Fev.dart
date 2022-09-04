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
        builder: (context, CandidateSkillListState state) {
          return Column(
            children: [
              RichText(
                text: TextSpan(
                  text: context.l10n.candidate_skills_list_skill_number_prefix,
                  children: [
                    TextSpan(
                      text: context.l10n.candidate_skills_list_skill_number(1),
                    ),
                    TextSpan(
                      text: context
                          .l10n.candidate_skills_list_skill_number_suffix,
                    ),
                  ],
                ),
              ),
              context.headlineSmall(),
              Wrap(
                spacing: Dimensions.paddingSmaller,
                runSpacing: Dimensions.paddingSmallest,
                children: state.skills
                    .map((skill) => _SkillChip(
                        skill, state.pendingDeletions.contains(skill)))
                    .toList(),
              ),
            ],
          );
        },
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
