import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/candidate_new_professional_experience_bloc.dart';

class CandidateNewProfessionalExperienceBlocListener extends StatelessWidget {
  const CandidateNewProfessionalExperienceBlocListener({
    super.key,
    this.onLoading,
    this.onSuccess,
    this.onError,
    required this.child,
  });

  final void Function(
          BuildContext context, CandidateNewProfessionalExperienceLoading)?
      onLoading;
  final void Function(
          BuildContext context, CandidateNewProfessionalExperienceSuccess)?
      onSuccess;
  final void Function(
      BuildContext context, CandidateNewProfessionalExperienceError)? onError;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CandidateNewProfessionalExperienceBloc,
        CandidateNewProfessionalExperienceState>(
      listener: (context, state) => state.mapOrNull(
        loading: (s) => onLoading?.call(context, s),
        success: (s) => onSuccess?.call(context, s),
        error: (s) => onError?.call(context, s),
      ),
      child: child,
    );
  }
}
