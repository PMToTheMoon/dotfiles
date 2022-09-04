import 'package:models/models.dart';

part 'doctor_service_request.freezed.dart';
part 'doctor_service_request.g.dart';

@freezed
class DoctorServiceRequest with _$DoctorServiceRequest {
  const DoctorServiceRequest._();

  const factory DoctorServiceRequest({
    required String doctorId,
    required ServiceType service,
  }) = _DoctorServiceRequest;
}
