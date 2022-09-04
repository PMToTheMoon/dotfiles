import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'doctor_consultation_request_data.freezed.dart';

@freezed
class DoctorConsultationRequestTileData
    with _$DoctorConsultationRequestTileData {
  const DoctorConsultationRequestTileData._();

  const factory DoctorConsultationRequestTileData.fold({
    RequestType? selectedRequestType,
  }) = DoctorConsultationRequestTileFold;

  const factory DoctorConsultationRequestTileData.unfold({
    RequestType? selectedRequestType,
  }) = DoctorConsultationRequestTileUnfold;

  bool get requestSelected => selectedRequestType != null;
}
