import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_consultation_request_bloc.freezed.dart';
part 'doctor_consultation_request_event.dart';
part 'doctor_consultation_request_state.dart';

class DoctorConsultationRequestTileBloc extends Bloc<
    DoctorConsultationRequestTileEvent, DoctorConsultationRequestTileState> {
  DoctorConsultationRequestTileBloc()
      : super(const DoctorConsultationRequestTileState.empty()) {
    on<DoctorConsultationRequestTileUnfoldRequested>(_onUnfoldRequested);
    on<DoctorConsultationRequestTileOptionSelected>(_onOptionSelected);
    on<DoctorConsultationRequestTileFoldRequested>(_onFoldRequested);
  }

  Future<void> _onUnfoldRequested(
      DoctorConsultationRequestTileUnfoldRequested event, Emitter emit) async {}

  Future<void> _onOptionSelected(
      DoctorConsultationRequestTileOptionSelected event, Emitter emit) async {}

  Future<void> _onFoldRequested(
      DoctorConsultationRequestTileFoldRequested event, Emitter emit) async {}
}
