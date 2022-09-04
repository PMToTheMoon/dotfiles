import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/record/add_doctor/widgets/add_doctor_list_view.dart';

import 'bloc/doctor_list_bloc.dart';

typedef DoctorsSelectedCallback = void Function(Set<SelectedDoctor> doctors);

class AddDoctorPage extends StatelessWidget {
  static Future<void> open(
    BuildContext context, {
    required Patient patient,
    required RecordType recordType,
    DoctorsSelectedCallback? onDoctorsSelected,
  }) =>
      Navigator.of(context).push(materialPageRoute(
        patient: patient,
        recordType: recordType,
        onDoctorsSelected: onDoctorsSelected,
      ));

  static MaterialPageRoute materialPageRoute({
    required Patient patient,
    required RecordType recordType,
    DoctorsSelectedCallback? onDoctorsSelected,
  }) =>
      MaterialPageRoute(
        builder: (context) => AddDoctorPage(
          patient: patient,
          recordType: recordType,
          onDoctorsSelected: onDoctorsSelected,
        ),
      );

  const AddDoctorPage({
    required this.patient,
    required this.recordType,
    this.onDoctorsSelected,
    super.key,
  });

  final Patient patient;
  final RecordType recordType;
  final DoctorsSelectedCallback? onDoctorsSelected;

  void _onStateChanged(BuildContext context, DoctorListState state) {
    if (state is DoctorListError) {
      Navigator.of(context).pop();
      context.showErrorSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return DoctorListBloc(
          userService: GetIt.instance.get(),
          doctorService: GetIt.instance.get(),
        )..add(const DoctorListEvent.started());
      },
      child: BlocListener<DoctorListBloc, DoctorListState>(
        listener: _onStateChanged,
        child: _AddDoctorPage(
          patient: patient,
          recordType: recordType,
          onDoctorSelected: onDoctorsSelected,
        ),
      ),
    );
  }
}

class _AddDoctorPage extends StatelessWidget {
  const _AddDoctorPage({
    super.key,
    required this.patient,
    required this.recordType,
    this.onDoctorSelected,
  });

  final Patient patient;
  final RecordType recordType;
  final DoctorsSelectedCallback? onDoctorSelected;

  @override
  Widget build(BuildContext context) {
    final AvatarCacheService avatarService = GetIt.instance.get();
    final state = context.select((DoctorListBloc bloc) => bloc.state);

    return Scaffold(
      appBar: titleSubtitleAvatarAppBar(
        context,
        title: context.l10n.add_doctor_page_title,
        subtitle: recordType.displayName(context),
        image: avatarService.avatar(patient.id),
      ),
      backgroundColor: context.colorScheme.surface,
      body: Stack(
        children: [
          AddDoctorListView(
            avatarCacheService: avatarService,
          ),
          if (state is DoctorListPresent)
            Positioned(
              bottom: Dimensions.paddingSmall,
              left: Dimensions.paddingSmall,
              right: Dimensions.paddingSmall,
              child: ElevatedButton(
                onPressed: (onDoctorSelected != null)
                    ? () => onDoctorSelected?.call(
                          context.read<DoctorListBloc>().state.selectedDoctors,
                        )
                    : null,
                child: Text(context.l10n.add_doctor_button),
              ),
            )
        ],
      ),
    );
  }
}
