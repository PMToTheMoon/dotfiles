import 'package:common/common.dart';
import 'package:flutter/material.dart';

class AddDoctorListView extends StatelessWidget {
  const AddDoctorListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadedList<int>(
      status: LoadedListStatus.loading,
      items: [],
      itemBuilder: (context, index, item) => DoctorConsultationRequestTile(
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
