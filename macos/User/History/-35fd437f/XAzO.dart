import 'package:common/common.dart';
import 'package:flutter/material.dart';

class AddDoctorListView extends StatelessWidget {
  const AddDoctorListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadedList(
      status: status,
      items: items,
      itemBuilder: itemBuilder,
      placeholderBuilder: placeholderBuilder,
      separatorBuilder: separatorBuilder,
      errorBuilder: errorBuilder,
      emptyBuilder: emptyBuilder,
    );
  }
}
