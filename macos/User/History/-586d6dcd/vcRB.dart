import 'package:bloc/bloc.dart';
import 'package:models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/record/record_service.dart';

part 'create_record_bloc.freezed.dart';
part 'create_record_event.dart';
part 'create_record_state.dart';

class CreateRecordBloc extends Bloc<CreateRecordEvent, CreateRecordState> {
  CreateRecordBloc({
    required this.recordService,
  }) : super(const CreateRecordInitial()) {
    on<CreateRecordCreationRequested>(_onCreationRequested);
  }

  final RecordService recordService;

  Future<void> _onCreationRequested(
    CreateRecordCreationRequested event,
    Emitter emit,
  ) async {
    if (state is CreateRecordCreate) return;
    await Future.delayed(Duration(seconds: 3));
    emit(CreateRecordState.create(
      record: event.record,
    ));
    try {
      final recordId = await recordService.newRecord(event.record);
      emit(CreateRecordState.success(
        recordId: recordId,
      ));
    } catch (e) {
      emit(const CreateRecordState.error());
    }
  }
}
