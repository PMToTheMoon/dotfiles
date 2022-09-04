import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:zanalys/doctor/doctor.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({
    super.key,
  });

  final AvatarCacheService cacheService;
  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return IdentityList(
      identities: doctors,
      identityBuilder: (Doctor doctor) => Identity(
        avatar: cacheService.avatar(doctor.id),
        firstName: firstName,
      ),
    );
  }
}
