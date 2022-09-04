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
        serviceRequest: null,
      ));
    } catch (e) {
      emit(const HubError());
    }
  }
}

DoctorServiceRequest? _findServiceRequest(Record record) {}
