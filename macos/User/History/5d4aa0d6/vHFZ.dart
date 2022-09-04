import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_consultation_request_data.freezed.dart';

@freezed
class DoctorConsultationRequestTileData
    with _$DoctorConsultationRequestTileData {
  const DoctorConsultationRequestTileData._();

  const factory DoctorConsultationRequestTileData.isFolded() =
      DoctorConsultationRequestTileEmpty;
  const factory DoctorConsultationRequestTileData.isUnfolded() =
      DoctorConsultationRequestTilePresentOptions;
}
