import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'package:common/common.dart';
import 'package:models/models.dart';

const _kPlaceholderNumber = 5;

class PatientList extends StatelessWidget {
  const PatientList({
    super.key,
    required this.patients,
    required this.avatarCacheService,
    this.onPatientSelected,
  });

  final List<Patient>? patients;
  final AvatarCacheService avatarCacheService;
  final void Function(Patient)? onPatientSelected;

  @override
  Widget build(BuildContext context) {
    if (patients == null) {
      return ListView.separated(
        itemCount: _kPlaceholderNumber,
        separatorBuilder: _dividerBuilder,
        itemBuilder: _placeholderBuilder,
      );
    } else {
      if (patients?.isEmpty == true)
        return const EmptyListIndicator(
          indicator: IndicatorType.noPatient,
        );

      return ListView.separated(
        itemCount: patients!.length,
        separatorBuilder: _dividerBuilder,
        itemBuilder: patients != null ? _patientBuilder : _placeholderBuilder,
      );
    }
  }

  Widget _patientBuilder(BuildContext context, int index) {
    final patient = patients![index];
    return Material(
      color: context.colorScheme.surface,
      child: InkWell(
        onTap: () => onPatientSelected?.call(patient),
        child: Padding(
          padding: const PaddingSmall(left | top | bottom),
          child: Identity(
            avatar: avatarCacheService.avatar(patient.id),
            firstName: patient.firstName ?? '',
            lastName: patient.lastName,
          ),
        ),
      ),
    );
  }
}

Widget _dividerBuilder(context, index) => const Divider(
      height: 1,
      indent: Dimensions.sizeLarge,
    );

Widget _placeholderBuilder(BuildContext context, int index) {
  return const Padding(
    padding: PaddingSmall(left | top | bottom),
    child: IdentityShimmer(),
  );
}
