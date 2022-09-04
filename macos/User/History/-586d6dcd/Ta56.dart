import 'package:bloc/bloc.dart';
import 'package:models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_record_bloc.freezed.dart';
part 'create_record_event.dart';
part 'create_record_state.dart';

class CreateRecordBloc extends Bloc<CreateRecordEvent, CreateRecordState> {
  CreateRecordBloc() : super(const CreateRecordInitial()) {
    on<CreateRecordCreationRequested>(_onCreationRequested);
    on<CreateRecordCreationSucceeded>(_onCreationSucceeded);
    on<CreateRecordCreationFailed>(_onCreationFailed);
  }

  Future<void> _onCreationRequested(
    CreateRecordCreationRequested event,
    Emitter emit,
  ) async {
    emit(CreateRecordState.create(
      record: event.record,
    ));
  }

  Future<void> _onCreationSucceeded(
      CreateRecordCreationSucceeded event, Emitter emit) async {}

  Future<void> _onCreationFailed(
      CreateRecordCreationFailed event, Emitter emit) async {}
}
