part of 'doctor_consultation_request_bloc.dart';

@freezed
class DoctorConsultationRequestTileState
    with _$DoctorConsultationRequestTileBloc {
  const DoctorConsultationRequestTileState._();

  const factory DoctorConsultationRequestTileState.waitSelection() =
      _DoctorConsultationRequestTileWaitingSelection;
  const factory DoctorConsultationRequestTileState.showOptions() =
      _DoctorConsultationRequestTileDisplayingOptions;
  const factory DoctorConsultationRequestTileState.showSelectedOption() =
      _DoctorConsultationRequestTileDisplayingSelectedOption;
}
