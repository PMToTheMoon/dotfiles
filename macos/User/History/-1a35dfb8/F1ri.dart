import 'package:bloc/bloc.dart';
import 'package:models/models.dart';
import 'package:zanalys/record/add_doctor/bloc/doctor_list_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/record/record_service.dart';

part 'record_doctors_bloc.freezed.dart';
part 'record_doctors_event.dart';
part 'record_doctors_state.dart';

class RecordDoctorsBloc extends Bloc<RecordDoctorsEvent, RecordDoctorsState> {
  RecordDoctorsBloc({
    required this.recordService,
  }) : super(const RecordDoctorsState.idle()) {
    on<RecordDoctorsEvent>(_onServicesRequested);
  }

  final RecordService recordService;

  Future<void> _onServicesRequested(
    RecordDoctorsServicesRequested event,
    Emitter emit,
  ) async {
    if (state is RecordDoctorsPostRequest) return;
    emit(const RecordDoctorsState.postRequest());
    try {
      for (final request in event.services) {
        await recordService.addDoctorToRecord(event.recordId, event.ser);
      }
      emit(const RecordDoctorsState.success());
    } catch (e) {
      emit(const RecordDoctorsState.error());
    } finally {
      emit(const RecordDoctorsState.idle());
    }
  }
}
