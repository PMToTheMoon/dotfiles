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

    return LoadedList<Doctor>(
      status: LoadedListStatus.loading,
      items: [],
      itemBuilder: (context, index, doctor) => DoctorConsultationRequestTile(
        avatar: avatarCacheService.avatar(doctor.id),
        firstName: doctor.firstName,
        lastName: doctor.lastName,
      ),
      placeholderBuilder: (context, index) => const IdentityShimmer(),
      separatorBuilder: (context, index) => Divider(),
      errorBuilder: (context) => const EmptyListIndicator(),
      emptyBuilder: (context) => const EmptyListIndicator(),
    );
  }
}
