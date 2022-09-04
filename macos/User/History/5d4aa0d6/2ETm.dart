part of 'doctor_consultation_request_bloc.dart';

@freezed
class DoctorConsultationRequestTileState
    with _$DoctorConsultationRequestTileBloc {
  const DoctorConsultationRequestTileState._();

  const factory DoctorConsultationRequestTileState.noOptionSelected() =
      _DoctorConsultationRequestTileNoOptionSeleted;
  const factory DoctorConsultationRequestTileState.presentOptions() =
      _DoctorConsultationRequestTilePresentOptions;
  const factory DoctorConsultationRequestTileState.showOption() =
      _DoctorConsultationRequestTileShowOption;
}
