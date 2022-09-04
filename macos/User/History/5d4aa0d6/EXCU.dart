import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_consultation_request_data.freezed.dart';

@freezed
class DoctorConsultationRequestTileData
    with _$DoctorConsultationRequestTileData {
  const DoctorConsultationRequestTileData._();

  const factory DoctorConsultationRequestTileData.empty() =
      DoctorConsultationRequestTileEmpty;
  const factory DoctorConsultationRequestTileData.presentOptions() =
      DoctorConsultationRequestTilePresentOptions;
  const factory DoctorConsultationRequestTileData.showOption() =
      DoctorConsultationRequestTileShowOption;
}
