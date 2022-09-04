import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/doctor/doctor.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({
    required this.doctors,
    required this.cacheService,
    super.key,
  });

  final AvatarCacheService cacheService;
  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: IdentityList(
              identities: doctors,
              identityBuilder: (Doctor doctor) => Identity(
                avatar: cacheService.avatar(doctor.id),
                firstName: doctor.firstName,
                lastName: doctor.lastName,
              ),
              footer: Padding(
                padding: PaddingSmall.horizontal(),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: HighlightedOutlinedButton(
                    onPressed: () {},
                    child: Center(child: Text("Bange")),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
