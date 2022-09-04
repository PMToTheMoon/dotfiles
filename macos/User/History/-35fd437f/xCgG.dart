import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class AddDoctorListView extends StatelessWidget {
  const AddDoctorListView({
    super.key,
    required this.avatarCacheService,
  });

  final AvatarCacheService avatarCacheService;

  @override
  Widget build(BuildContext context) {
    return LoadedList<Doctor>(
      status: LoadedListStatus.loading,
      items: [],
      itemBuilder: (context, index, doctor) => DoctorConsultationRequestTile(
        avatar: avatar,
        firstName: firstName,
        lastName: lastName,
      ),
      placeholderBuilder: placeholderBuilder,
      separatorBuilder: separatorBuilder,
      errorBuilder: errorBuilder,
      emptyBuilder: emptyBuilder,
    );
  }
}
