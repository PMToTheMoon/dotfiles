import 'package:bloc/bloc.dart';
import 'package:models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/user/user_service.dart';

part 'create_record_bloc.freezed.dart';
part 'create_record_event.dart';
part 'create_record_state.dart';

class CreateRecordBloc extends Bloc<CreateRecordEvent, CreateRecordState> {
  CreateRecordBloc({
    required this.userService,
  }) : super(const CreateRecordInitial()) {
    on<CreateRecordCreationRequested>(_onCreationRequested);
  }

  final UserService userService;

  Future<void> _onCreationRequested(
    CreateRecordCreationRequested event,
    Emitter emit,
  ) async {
    if (state is CreateRecordCreate) return;
    emit(CreateRecordState.create(
      record: event.record,
    ));
    try {
      await userService.newRecord(event.record);
      emit(const CreateRecordState.success());
    } catch (e) {
      emit(const CreateRecordState.error());
    }
  }
}
