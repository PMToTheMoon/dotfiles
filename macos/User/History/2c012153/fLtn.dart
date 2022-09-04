import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

class TestConsumer extends StatelessWidget {
  const TestConsumer({
    super.key,
    this.onLoading,
    this.onSuccess,
    this.onError,
    required this.child,
  });

  final void Function(BuildContext context, TestLoading)? onLoading;
  final void Function(BuildContext context, TestSuccess)? onSuccess;
  final void Function(BuildContext context, TestError)? onError;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TestBloc, TestState>(
      listener: (context, state) => state.mapOrNull(
        loading: (s) => onLoading?.call(context, s),
        success: (s) => onSuccess?.call(context, s),
        error: (s) => onError?.call(context, s),
      ),
      child: child,
    );
  }
}
