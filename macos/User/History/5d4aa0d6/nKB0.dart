part of 'doctor_consultation_request_bloc.dart';

@freezed
class DoctorConsultationRequestTileState
    with _$DoctorConsultationRequestTileBloc {
  const DoctorConsultationRequestTileState._();

  const factory DoctorConsultationRequestTileState.waitSelection() =
      _DoctorConsultationRequestTileWaitSelection;
  const factory DoctorConsultationRequestTileState.presentOptions() =
      _DoctorConsultationRequestTilePresentOptions;
  const factory DoctorConsultationRequestTileState.showOption() =
      _DoctorConsultationRequestTileShowOption;
}
