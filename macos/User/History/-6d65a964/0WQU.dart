import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:zanalys/user/user_service.dart';

const _kPlaceholderNumber = 3;

class PatientList extends StatelessWidget {
  const PatientList({
    super.key,
    required this.patients,
    required this.avatarCacheService,
  });

  final List<Patient>? patients;
  final AvatarCacheService avatarCacheService;

  @override
  Widget build(BuildContext context) {
    if (patients?.isEmpty == true) return const EmptyListIndicator();

    return ListView.separated(
      itemCount: patients?.length ?? _kPlaceholderNumber,
      separatorBuilder: (context, index) => const Divider(
        height: Dimensions.spaceMedium,
        indent: Dimensions.sizeLarge,
      ),
      itemBuilder: patients != null ? _patientBuilder : _placeholderBuilder,
    );
  }

  Widget _patientBuilder(context, index) {
    final patient = patients![index];
    return Padding(
      padding: index + 1 == patients?.length
          ? const EdgeInsets.only(
              left: Dimensions.paddingSmall,
              bottom: Dimensions.paddingMedium,
            )
          : const PaddingSmall.left(),
      child: Identity(
        avatar: avatarCacheService.avatar(patient.id),
        firstName: patient.firstName,
        lastName: patient.lastName,
      ),
    );
  }
}

Widget _placeholderBuilder(BuildContext context, int index) {
  return Shimmer(
      child: Container(
    color: Colors.white,
    height: 89,
    width: double.infinity,
  ));
}
