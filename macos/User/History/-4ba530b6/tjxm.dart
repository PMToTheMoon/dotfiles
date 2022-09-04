import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return Wrap(
            spacing: Dimensions.paddingSmaller,
            runSpacing: Dimensions.paddingSmallest,
            children: state.skills
                .map(
                  (skill) => InputChip(
                    label: Text(skill),
                    onDeleted: () {},
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
