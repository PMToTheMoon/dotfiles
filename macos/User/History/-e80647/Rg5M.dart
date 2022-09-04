import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/candidate_new_education_bloc.dart';

class CandidateNewProfessionalExperienceBlocListener extends StatelessWidget {
  const CandidateNewProfessionalExperienceBlocListener({
    super.key,
    this.onLoading,
    this.onSuccess,
    this.onError,
    required this.child,
  });

  final void Function(
    BuildContext context,
    CandidateNewProfessionalExperienceLoading,
  )? onLoading;

  final void Function(
    BuildContext context,
    CandidateNewProfessionalExperienceSuccess,
  )? onSuccess;

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

class CandidateNewProfessionalExperienceBlocBuilder extends StatelessWidget {
  const CandidateNewProfessionalExperienceBlocBuilder({
    super.key,
    required this.idle,
    required this.loading,
    required this.success,
    required this.error,
  });

  final Widget Function(
    BuildContext context,
    CandidateNewProfessionalExperienceIdle,
  )? idle;

  final Widget Function(
    BuildContext context,
    CandidateNewProfessionalExperienceLoading,
  ) loading;

  final Widget Function(
    BuildContext context,
    CandidateNewProfessionalExperienceSuccess,
  ) success;

  final Widget Function(
    BuildContext context,
    CandidateNewProfessionalExperienceError,
  ) error;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CandidateNewProfessionalExperienceBloc,
        CandidateNewProfessionalExperienceState>(
      builder: (context, state) {
        return state.map(
          idle: (s) => idle?.call(context, s) ?? const SizedBox.shrink(),
          loading: (s) => loading(context, s),
          success: (s) => success(context, s),
          error: (s) => error(context, s),
        );
      },
    );
  }
}
