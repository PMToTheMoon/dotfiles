import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:zanalys/doctor/doctor.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({
    super.key,
  });

  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return IdentityList(
      identities: doctors,
      identityBuilder: (doctor) => Identity(
        avatar: avatar,
        firstName: firstName,
      ),
    );
  }
}
