import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/candidate/profile/skills/add_skills/add_skills_view.dart';
import 'package:tech_by_tech/candidate/profile/skills/skill_list/skill_list.dart';
import 'package:translations/translations.dart';

class CandidateSkillsView extends StatelessWidget {
  static CandidateSkillsView builder(BuildContext context) =>
      const CandidateSkillsView();

  const CandidateSkillsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        context.headlineMedium(context.l10n.candidate_skills_add_skill_to_list),
        const SpaceSmallest.h(),
        context.bodyMedium(context.l10n.candidate_skills_subtitle),
        const SpaceSmallest.h(),
        const CandidateAddSkillView(),
        const SpaceLarge.h(),
        const CandidateSkillListView(),
      ],
    );
  }
}
