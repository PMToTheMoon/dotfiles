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
    required this.recordId,
  }) : super(const HubInitial()) {
    on<HubFetchRequested>(_onFetchRequested);
  }

  final UserService userService;
  final RecordService recordService;
  final String recordId;

  Future<void> _onFetchRequested(HubFetchRequested event, Emitter emit) async {
    if (state is HubFetching) return;
    emit(const HubFetching());
    try {
      // patientDetails(patientId);
      final Record data = await recordService.fullRecord(recordId);
      emit(HubReady(
        data: data,
        // currentUserIsCreator: data.creatorId == userService.user!.id,
        showInitialObservationForm: data.status.isDraft,
        doctors: _findDoctors(data).toList(),
        serviceRequest: null,
      ));
    } catch (e) {
      emit(const HubError());
    }
  }
}

DoctorServiceRequest? _findServiceRequest(String userId, Record record) {
  if (record.providerId == userId) {
    if (record.status == RecordStatus.waitingReport) {
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
