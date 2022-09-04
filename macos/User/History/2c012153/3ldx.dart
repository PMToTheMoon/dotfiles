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

class DeleteUserJobBlocConsumer extends StatelessWidget {
  const DeleteUserJobBlocConsumer({
    super.key,
    this.onLoading,
    this.onSuccess,
    this.onError,
    this.initial,
    required this.loading,
    required this.success,
    required this.error,
  });

  final void Function(BuildContext context, DeleteUserJobLoading)? onLoading;
  final void Function(BuildContext context, DeleteUserJobSuccess)? onSuccess;
  final void Function(BuildContext context, DeleteUserJobError)? onError;

  final Widget Function(BuildContext context, DeleteUserJobInitial)? initial;
  final Widget Function(BuildContext context, DeleteUserJobLoading) loading;
  final Widget Function(BuildContext context, DeleteUserJobSuccess) success;
  final Widget Function(BuildContext context, DeleteUserJobError) error;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteUserJobBloc, DeleteUserJobState>(
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
