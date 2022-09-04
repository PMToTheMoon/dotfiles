import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lib/user_repository.dart';

part 'delete_user_job_bloc.freezed.dart';
part 'delete_user_job_event.dart';
part 'delete_user_job_state.dart';

class DeleteUserJobBloc extends Bloc<DeleteUserJobEvent, DeleteUserJobState> {
  DeleteUserJobBloc({required this.userRepository, required this.jobId})
      : super(const DeleteUserJobInitial()) {
    on<DeleteUserJobStarted>(_onStarted);
  }

  final UserRepository userRepository;

  final String jobId;

  _onStarted(DeleteUserJobStarted event, Emitter emit) async {
    if (state is DeleteUserJobLoading) return;
    emit(const DeleteUserJobLoading());
    try {
      await userRepository.deleteJob(jobId);
      emit(const DeleteUserJobSuccess());
    } catch (e) {
      emit(const DeleteUserJobError());
    }
  }
}

class TestBuilder extends StatelessWidget {
  const TestBuilder({
    super.key,
    this.initial,
    required this.loading,
    required this.success,
    required this.error,
  });

  final Widget Function(BuildContext context, TestInitial)? initial;
  final Widget Function(BuildContext context, TestLoading) loading;
  final Widget Function(BuildContext context, TestSuccess) success;
  final Widget Function(BuildContext context, TestError) error;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        return state.mapOrNull(
          initial: (s) => initial?.call(context, s) ?? const SizedBox.shrink(),
          loading: (s) => loading(context, s),
          success: (s) => success(context, s),
          error: (s) => error(context, s),
        );
      },
    );
  }
}
