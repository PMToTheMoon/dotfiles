import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

import '../bloc/doctor_list_bloc.dart';

class AddDoctorListView extends StatelessWidget {
  const AddDoctorListView({
    super.key,
    required this.avatarCacheService,
  });

  final AvatarCacheService avatarCacheService;

  @override
  Widget build(BuildContext context) {
    final state = context.select((DoctorListBloc bloc) => bloc.state);

    final status = state.map(
      fetch: (_) => LoadedListStatus.loading,
      initial: (_) => LoadedListStatus.loading,
      present: (_) => LoadedListStatus.loaded,
      error: (_) => LoadedListStatus.error,
    );

    return LoadedList(
      status: status,
      items: state.doctors.toList(),
      itemBuilder: (context, index, doctor) => DoctorConsultationRequestTile(
        key: ValueKey(doctor.id),
        avatar: avatarCacheService.avatar(doctor.id),
        firstName: doctor.firstName,
        lastName: doctor.lastName,
        onSelected: (request) => context.read<DoctorListBloc>().add(
            DoctorListEvent.doctorSelected(doctor: doctor, request: request)),
        onUnselected: () => context
            .read<DoctorListBloc>()
            .add(DoctorListEvent.doctorUnselected(doctor: doctor)),
      ),
      placeholderBuilder: (context, index) => const IdentityShimmer(),
      separatorBuilder: (context, index) => const IndentedDivider(),
      errorBuilder: (context) => const EmptyListIndicator(),
      emptyBuilder: (context) => const EmptyListIndicator(),
    );
  }
}
