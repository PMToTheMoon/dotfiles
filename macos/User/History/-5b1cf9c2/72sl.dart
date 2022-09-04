import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';

import 'package:models/models.dart';
import 'package:common/common.dart';
import 'package:zanalys/record/add_doctor/add_doctor_page.dart';
import 'package:zanalys/record/hub/bloc/hub_bloc.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({
    required this.doctors,
    required this.cacheService,
    super.key,
  });

  final HubReady hub;
  final AvatarCacheService cacheService;
  final List<Doctor> doctors;

  void _onAddDoctorPressed(BuildContext context) async {
    await AddDoctorPage.open(context,
        patient: hub.record.patient,
        recordType: hub.record.type,
        onDoctorsSelected: (doctors) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpaceSmall.h(),
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
                padding: const EdgeInsets.only(
                  left: Dimensions.paddingSmall,
                  right: Dimensions.paddingSmall,
                  top: Dimensions.paddingMedium,
                ),
                child: HighlightedOutlinedButton(
                  onPressed: () => _onAddDoctorPressed(context),
                  child: Center(child: Text(context.l10n.add)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
