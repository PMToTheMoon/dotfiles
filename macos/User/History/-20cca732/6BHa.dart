import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_by_tech/candidate/profile/skills/update_skills/bloc/candidate_update_skills_bloc.dart';

class CandidateAddSkillView extends StatelessWidget {
  const CandidateAddSkillView({
    super.key,
  });

  void _onStateChanged(
    BuildContext context,
    CandidateUpdateSkillsState state,
  ) {
    if (state is CandidateUpdateSkillsError) {
      context.showErrorSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CandidateUpdateSkillsBloc(
        candidateRepository: context.read(),
      ),
      child:
          BlocListener<CandidateUpdateSkillsBloc, CandidateUpdateSkillsState>(
        listener: _onStateChanged,
        child: const _CandidateAddSkillsView(),
      ),
    );
  }
}

class _CandidateAddSkillsView extends StatefulWidget {
  const _CandidateAddSkillsView({
    super.key,
  });

  @override
  State<_CandidateAddSkillsView> createState() =>
      _CandidateAddSkillsViewState();
}

class _CandidateAddSkillsViewState extends State<_CandidateAddSkillsView> {
  late final ChipEditingController _controller = ChipEditingController();
  bool _lockSubmitButton = true;

  void _onChipEditorValueChanged(Set<String> chips) {
    final lock = chips.isEmpty;
    if (_lockSubmitButton != lock) {
      setState(() {
        _lockSubmitButton = lock;
      });
    }
  }

  void _submitSkills() {
    context.read<CandidateUpdateSkillsBloc>()
      ..add(CandidateUpdateSkillsEvent.updated(update: update));
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ChipEditorField(
              controller: _controller,
              onChanged: _onChipEditorValueChanged,
            ),
          ),
          const SpaceSmaller.w(),
          ElevatedButton(
            onPressed: _lockSubmitButton ? null : () {},
            child: Text("Ajouter à la liste"),
          ),
        ],
      ),
    );
  }
}
