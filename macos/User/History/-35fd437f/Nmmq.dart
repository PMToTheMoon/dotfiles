import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return LoadedList<DoctorTile>(
      status: status,
      items: [], //state.doctors.toList(),
      itemBuilder: (context, index, data) => DoctorConsultationRequestTile(
        key: ValueKey(data.doctor.id),
        controller: data.controller,
        avatar: avatarCacheService.avatar(data.doctor.id),
        firstName: data.doctor.firstName,
        lastName: data.doctor.lastName,
        onSelected: (request) =>
            context.read<DoctorListBloc>().add(DoctorListEvent.doctorSelected(
                  doctor: data.doctor,
                  request: request,
                )),
        onUnselected: () => context
            .read<DoctorListBloc>()
            .add(DoctorListEvent.doctorUnselected(doctor: data.doctor)),
      ),
      placeholderBuilder: (context, index) => const Padding(
        padding: PaddingSmall(),
        child: IdentityShimmer(),
      ),
      separatorBuilder: (context, index) => const IndentedDivider(),
      errorBuilder: (context) => const EmptyListIndicator(),
      emptyBuilder: (context) => const EmptyListIndicator(
        indicator: IndicatorType.noDoctor,
      ),
      footer: const SpaceLargest.h(),
    );
  }
}
