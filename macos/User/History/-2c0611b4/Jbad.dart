export 'package:zanalys_api/zanalys_api.dart'
    show PatientDetails, $PatientDetailsCopyWith, $UserDetailsCopyWith;

import 'package:common/common.dart';
import 'package:zanalys_api/zanalys_api.dart' as api show Gender;

extension ToDomainGender on api.Gender {
  Gender toDomain() {
    switch (this) {
      case api.Gender.male:
        return Gender.male;
      case api.Gender.female:
        return Gender.female;
    }
  }
}
