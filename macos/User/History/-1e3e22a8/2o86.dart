import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:zanalys/doctor/doctor_service.dart';
import 'package:zanalys/record/record_service.dart';
import 'package:zanalys/user/user_service.dart';
part 'hub_bloc.freezed.dart';
part 'hub_state.dart';
part 'hub_event.dart';

class HubBloc extends Bloc<HubEvent, HubState> {
  HubBloc({
    required this.userService,
    required this.recordService,
    required this.doctorService,
    required this.recordId,
  }) : super(const HubInitial()) {
    on<HubFetchRequested>(_onFetchRequested);
  }

  final UserService userService;
  final DoctorService doctorService;
  final RecordService recordService;
  final String recordId;

  Future<void> _onFetchRequested(HubFetchRequested event, Emitter emit) async {
    if (state is HubFetching) return;
    emit(const HubFetching());
    try {
      final Record rootRecord = await recordService.fullRecord(recordId);
      final doctors = _findDoctors(rootRecord);
      final doctorWithEstablishments =
          await _associateDoctorsWithEstablishments(doctors);
      final userId = userService.user!.id!;

      emit(
        HubReady(
          rootRecord: rootRecord,
          effectiveRecord: _findEffectiveRecord(userId, rootRecord),
          showInitialObservationForm: rootRecord.status.isDraft,
          doctors: doctorWithEstablishments.toList(),
          serviceRequest: _findServiceRequest(
            userId,
            rootRecord,
          ),
        ),
      );
    } catch (e) {
      emit(const HubError());
    }
  }

  Record _findEffectiveRecord(String userId, Record rootRecord) {
    if (userId == rootRecord.providerId) return rootRecord;
    for (final Record child in rootRecord.childRecords ?? []) {
      if (child.providerId == userId) return child;
    }
    throw "Current userId didn't match any providerId inside record and it's children";
  }

  Future<Iterable<DoctorWithEstablishments>>
      _associateDoctorsWithEstablishments(
    Iterable<Doctor> doctors,
  ) async {
    return doctors.map((e) => DoctorWithEstablishments(
          doctor: e,
          establishments: [],
        ));
    return await Future.forEach(doctors, _associateDoctorWithEstablishments);
  }

  Future<DoctorWithEstablishments> _associateDoctorWithEstablishments(
    Doctor doctor,
  ) async {
    final establishments =
        <Establishment>[]; //await doctorService.establishments(doctor.id);
    return DoctorWithEstablishments(
      doctor: doctor,
      establishments: establishments,
    );
  }

  Iterable<Doctor> _findDoctors(Record record) {
    Set<Doctor?> doctors = {};
    doctors.addAll([
      _doctor(record),
      _delegate(record),
      _provider(record),
      for (final child in record.childRecords ?? []) ..._findDoctors(child)
    ]);
    return doctors.whereType<Doctor>();
  }
}

DoctorServiceRequest? _findServiceRequest(String userId, Record record) {
  if (record.providerId == userId) {
    if (record.status == RecordStatus.waitingReport ||
        record.status == RecordStatus.waitingCompleteReport) {
      final serviceRequested = record.serviceRequested;
      return DoctorServiceRequest(
        doctorId: userId,
        service: serviceRequested ?? ServiceType.inPerson,
      );
    }
  }
  for (final child in record.childRecords ?? []) {
    final request = _findServiceRequest(userId, child);
    if (request != null) return request;
  }
  return null;
}

Doctor? _doctor(Record record) {
  try {
    return Doctor(
      id: record.doctorId!,
      firstName: record.doctorFirstName!,
      lastName: record.doctorLastName!,
    );
  } catch (_) {
    return null;
  }
}

Doctor? _provider(Record record) {
  try {
    return Doctor(
      id: record.providerId!,
      firstName: record.providerFirstName!,
      lastName: record.providerLastName!,
    );
  } catch (_) {
    return null;
  }
}

Doctor? _delegate(Record record) {
  try {
    return Doctor(
      id: record.delegateDoctor!,
      firstName: record.delegateDoctorFirstName!,
      lastName: record.delegateDoctorLastName!,
    );
  } catch (_) {
    return null;
  }
}
