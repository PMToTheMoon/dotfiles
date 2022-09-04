import 'package:common/common.dart';

extension ToDomainGender on Gender {
  Gender toDomain() {
    switch (this) {
      case Gender.male:
        return Gender.male;
      case Gender.female:
        return Gender.female;
    }
  }
}
