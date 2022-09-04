import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/candidate_new_education_bloc.dart';

class CandidateNewEducationBlocListener extends StatelessWidget {
  const CandidateNewEducationBlocListener({
    super.key,
    this.onLoading,
    this.onSuccess,
    this.onError,
    required this.child,
  });

  final void Function(
    BuildContext context,
    CandidateNewEducationLoading,
  )? onLoading;

  final void Function(
    BuildContext context,
    CandidateNewEducationSuccess,
  )? onSuccess;

  final void Function(BuildContext context, CandidateNewEducationError)?
      onError;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CandidateNewEducationBloc, CandidateNewEducationState>(
      listener: (context, state) => state.mapOrNull(
        loading: (s) => onLoading?.call(context, s),
        success: (s) => onSuccess?.call(context, s),
        error: (s) => onError?.call(context, s),
      ),
      child: child,
    );
  }
}

class CandidateNewEducationBlocBuilder extends StatelessWidget {
  const CandidateNewEducationBlocBuilder({
    super.key,
    required this.idle,
    required this.loading,
    required this.success,
    required this.error,
  });

  final Widget Function(
    BuildContext context,
    CandidateNewEducationIdle,
  )? idle;

  final Widget Function(
    BuildContext context,
    CandidateNewEducationLoading,
  ) loading;

  final Widget Function(
    BuildContext context,
    CandidateNewEducationSuccess,
  ) success;

  final Widget Function(
    BuildContext context,
    CandidateNewEducationError,
  ) error;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CandidateNewEducationBloc, CandidateNewEducationState>(
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
