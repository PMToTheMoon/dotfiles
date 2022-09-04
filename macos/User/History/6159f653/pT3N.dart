part of 'hub_bloc.dart';

class DoctorWithEstablishments {
  final Doctor doctor;
  final List<Establishment> establishments;

  DoctorWithEstablishments({
    required this.doctor,
    required this.establishments,
  });
}

@freezed
class HubState with _$HubState {
  const factory HubState.initial() = HubInitial;

  const factory HubState.fetching() = HubFetching;

  const factory HubState.ready({
    required Record rootRecord,
    required Record effectiveRecord,
    required bool showInitialObservationForm,
    required DoctorServiceRequest? serviceRequest,
    required List<DoctorWithEstablishments> doctors,
  }) = HubReady;

  const factory HubState.error([String? message]) = HubError;
}
