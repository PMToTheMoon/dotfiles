part of 'doctor_consultation_request_bloc.dart';

@freezed
class DoctorConsultationRequestTileBloc
    with _$DoctorConsultationRequestTileBloc {
  const DoctorConsultationRequestTileBloc._();

  const factory DoctorConsultationRequestTileBloc.notSelected() =
      _DoctorConsultationRequestTileBloc;
  const factory DoctorConsultationRequestTileBloc.un() =
      _DoctorConsultationRequestTileBloc;
  const factory DoctorConsultationRequestTileBloc.unselected() =
      _DoctorConsultationRequestTileBloc;
}
