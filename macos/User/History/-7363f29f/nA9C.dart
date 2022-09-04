import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/candidate_professional_experiences_bloc.dart';

class CandidateProfessionalExperiencesBlocConsumer extends StatelessWidget {
  const CandidateProfessionalExperiencesBlocConsumer({
    super.key,
    this.onLoading,
    this.onSuccess,
    this.onError,
    this.initial,
    required this.loading,
    required this.success,
    required this.error,
  });

  final void Function(
      BuildContext context, CandidateProfessionalExperiencesLoading)? onLoading;
  final void Function(
      BuildContext context, CandidateProfessionalExperiencesSuccess)? onSuccess;
  final void Function(
      BuildContext context, CandidateProfessionalExperiencesError)? onError;

  final Widget Function(
      BuildContext context, CandidateProfessionalExperiencesInitial)? initial;
  final Widget Function(
      BuildContext context, CandidateProfessionalExperiencesLoading) loading;
  final Widget Function(
      BuildContext context, CandidateProfessionalExperiencesSuccess) success;
  final Widget Function(
      BuildContext context, CandidateProfessionalExperiencesError) error;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CandidateProfessionalExperiencesBloc,
        CandidateProfessionalExperiencesState>(
      listener: (context, state) => state.mapOrNull(
        loading: (s) => onLoading?.call(context, s),
        success: (s) => onSuccess?.call(context, s),
        error: (s) => onError?.call(context, s),
      ),
      builder: (context, state) {
        return state.map(
          initial: (s) => initial?.call(context, s) ?? const SizedBox.shrink(),
          loading: (s) => loading(context, s),
          success: (s) => success(context, s),
          error: (s) => error(context, s),
        );
      },
    );
  }
}
