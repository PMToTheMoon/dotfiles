import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_consultation_request_bloc.freezed.dart';
part 'doctor_consultation_request_event.dart';
part 'doctor_consultation_request_state.dart';

class DoctorConsultationRequestBloc extends Bloc<
    DoctorConsultationRequestTileEvent, DoctorConsultationRequestTileState> {
  DoctorConsultationRequestBloc()
      : super(const DoctorConsultationRequestTileState.empty()) {
    on<DoctorConsultationRequestTileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<void> _onUnfoldRequested(
      DoctorConsultationRequestTileUnfoldRequested event, Emitter emit) async {}
  Future<void> _onOptionSelected(
      DoctorConsultationRequestTileOptionSelected event, Emitter emit) async {}
  Future<void> _onFoldRequested(
      DoctorConsultationRequestTileFoldRequested event, Emitter emit) async {}
}
