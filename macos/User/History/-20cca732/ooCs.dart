import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/candidate/profile/skills/skill_list/skill_list.dart';

class CandidateSkillsView extends StatefulWidget {
  static CandidateSkillsView builder(BuildContext context) =>
      const CandidateSkillsView();

  const CandidateSkillsView({
    super.key,
  });

  @override
  State<CandidateSkillsView> createState() => _CandidateSkillsViewState();
}

class _CandidateSkillsViewState extends State<CandidateSkillsView> {
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

  void _submitSkills() {}

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
