import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:models/models.dart';
import 'package:zanalys/doctor/doctor_service.dart';

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
    required this.doctorService,
    this.excludeSelectedDoctors = false,
    String? filter,
    List<Doctor>? selectedDoctors,
  }) : super(DoctorListState.initial(
          filter: filter,
          selectedDoctors: selectedDoctors ?? [],
          doctors: [],
        )) {
    on<DoctorListStarted>(_onStarted);
    on<DoctorListFilterChanged>(_onFilterChanged);
    on<DoctorListDoctorSelected>(_onDoctorSelected);
    on<DoctorListDoctorUnselected>(_onDoctorUnselected);
  }

  final DoctorService doctorService;

  final bool excludeSelectedDoctors;

  Future<void> _onStarted(
    DoctorListStarted event,
    Emitter emit,
  ) async {
    await _fetchDoctors(emit);
  }

  Future<void> _onFilterChanged(
    DoctorListFilterChanged event,
    Emitter emit,
  ) async {}

  Future<void> _onDoctorSelected(
    DoctorListDoctorSelected event,
    Emitter emit,
  ) async {}

  Future<void> _onDoctorUnselected(
    DoctorListDoctorUnselected event,
    Emitter emit,
  ) async {}

  Future<void> _fetchDoctors(Emitter emit) async {
    try {
      emit(DoctorListState.fetch(
        selectedDoctors: state.selectedDoctors,
        doctors: state.doctors,
      ));
      final doctors = await doctorService.fetchAcceptedNetworkDoctors();
      emit(DoctorListState.present(
        selectedDoctors: state.selectedDoctors,
        doctors: doctors,
      ));
    } catch (e) {
      emit(DoctorListState.error(
        selectedDoctors: state.selectedDoctors,
        doctors: state.doctors,
      ));
    }
  }

  Future<void> _transformDoctors(List<Doctor> raw) async {
    int compareDoctor(Doctor a, Doctor b) {
      final aIsSelected = state.selectedDoctors.contains(a);
      final bIsSelected = state.selectedDoctors.contains(a);
      if (aIsSelected && !bIsSelected) return -1;
      if (!aIsSelected && bIsSelected) return 1;
      return a.firstName.compareTo(b.firstName);
    }

    raw.sort(compareDoctor);
  }
}
