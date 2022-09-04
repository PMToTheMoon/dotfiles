import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:models/models.dart';
import 'package:zanalys/doctor/doctor_service.dart';
import 'package:zanalys/user/user_service.dart';

part 'doctor_list_bloc.freezed.dart';
part 'doctor_list_event.dart';
part 'doctor_list_state.dart';

// use case: stream based api vs future based
//
// MetaObject: criteria [value(set), collection(add, remove), parameter(immutable)]
// String (set)
// final List<Doctor> selectedDoctors = [];
// List (add, remove)
// const String filter = '';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  DoctorListBloc({
    required this.userService,
    required this.doctorService,
    this.excludeSelectedDoctors = false,
    this.excludeDoctors = const [],
    String? filter,
    Set<SelectedDoctor>? selectedDoctors,
  }) : super(DoctorListState.initial(
          filter: filter,
          selectedDoctors: selectedDoctors ?? {},
          doctors: {},
        )) {
    on<DoctorListStarted>(_fetchDoctors);
    on<DoctorListFilterChanged>(_onFilterChanged);
    on<DoctorListDoctorSelected>(_onDoctorSelected);
    on<DoctorListDoctorUnselected>(_onDoctorUnselected);
  }

  final UserService userService;
  final DoctorService doctorService;
  final List<String> excludeDoctors;

  final bool excludeSelectedDoctors;

  Future<void> _onFilterChanged(
    DoctorListFilterChanged event,
    Emitter emit,
  ) async {}

  Future<void> _onDoctorSelected(
    DoctorListDoctorSelected event,
    Emitter emit,
  ) async {
    final selectedDoctors = Set.of(state.selectedDoctors)
      ..add(SelectedDoctor(
        doctor: event.doctor,
        request: event.request,
      ));

    emit(state.copyWith(
      selectedDoctors: selectedDoctors,
      doctors: _transformDoctors(
        state.doctors,
        selectedDoctors: selectedDoctors,
      ),
    ));
  }

  Future<void> _onDoctorUnselected(
    DoctorListDoctorUnselected event,
    Emitter emit,
  ) async {
    final selectedDoctors = Set.of(state.selectedDoctors)
      ..removeWhere((e) => e.doctor == event.doctor);

    emit(state.copyWith(
      selectedDoctors: selectedDoctors,
      doctors: _transformDoctors(
        state.doctors,
        selectedDoctors: selectedDoctors,
      ),
    ));
  }

  Future<void> _fetchDoctors(DoctorListStarted event, Emitter emit) async {
    try {
      emit(DoctorListState.fetch(
        selectedDoctors: state.selectedDoctors,
        doctors: state.doctors,
      ));
      final doctors = await doctorService.fetchAcceptedNetworkDoctors();
      final transformedDoctors = _transformDoctors(
        doctors.map((d) => DoctorTile(
              doctor: d,
              controller: DoctorConsultationRequestTileController(),
            )),
        selectedDoctors: state.selectedDoctors,
      );
      emit(DoctorListState.present(
        selectedDoctors: state.selectedDoctors,
        doctors: transformedDoctors,
      ));
    } catch (e) {
      emit(DoctorListState.error(
        selectedDoctors: state.selectedDoctors,
        doctors: state.doctors,
      ));
    }
  }

  Set<DoctorTile> _transformDoctors(
    Iterable<DoctorTile> raw, {
    required Set<SelectedDoctor> selectedDoctors,
  }) {
    final me = userService.user!.id;
    final transformed = List<DoctorTile>.of(raw);

    transformed.removeWhere((tile) => tile.doctor.id == me);

    int compareDoctor(DoctorTile a, DoctorTile b) {
      final selected = selectedDoctors.map((e) => e.doctor);
      final aIsSelected = selected.contains(a.doctor);
      final bIsSelected = selected.contains(b.doctor);
      if (aIsSelected && !bIsSelected) return -1;
      if (!aIsSelected && bIsSelected) return 1;
      return a.doctor.firstName.compareTo(b.doctor.firstName);
    }

    transformed.sort(compareDoctor);

    return transformed.toSet();
  }
}
