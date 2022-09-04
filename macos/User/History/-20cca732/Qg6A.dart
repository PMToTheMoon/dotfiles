import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:translations/translations.dart';
import 'bloc/candidate_update_skills_bloc.dart';

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
        child:
            BlocBuilder<CandidateUpdateSkillsBloc, CandidateUpdateSkillsState>(
          builder: (context, state) => _CandidateAddSkillsView(
            state: state,
          ),
        ),
      ),
    );
  }
}

class _CandidateAddSkillsView extends StatefulWidget {
  const _CandidateAddSkillsView({
    required this.state,
    super.key,
  });

  final CandidateUpdateSkillsState state;

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
    context.read<CandidateUpdateSkillsBloc>().add(
        CandidateUpdateSkillsEvent.updated(
            update: _controller.value.map((s) => Skill(name: s))));
    _controller.value = {};
    setState(() {
      _lockSubmitButton = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ChipEditorField(
              enabled: widget.state is CandidateUpdateSkillsIdle,
              controller: _controller,
              onChanged: _onChipEditorValueChanged,
            ),
          ),
          const SpaceSmaller.w(),
          SubmitButton(
            loading: widget.state is CandidateUpdateSkillsLoading,
            onPressed: _lockSubmitButton ? null : _submitSkills,
            child: Text(context.l10n.candidate_skills_add_skill_to_list),
          ),
        ],
      ),
    );
  }
}
