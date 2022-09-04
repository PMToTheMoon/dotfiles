part of 'doctor_consultation_request_bloc.dart';

@freezed
class DoctorConsultationRequestTileBloc
    with _$DoctorConsultationRequestTileBloc {
  const DoctorConsultationRequestTileBloc._();

  const factory DoctorConsultationRequestTileBloc.waitingSelection() =
      _DoctorConsultationRequestTileBloc;
  const factory DoctorConsultationRequestTileBloc.displayingOption() =
      _DoctorConsultationRequestTileBloc;
  const factory DoctorConsultationRequestTileBloc.unselected() =
      _DoctorConsultationRequestTileBloc;
}
