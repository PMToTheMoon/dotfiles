part 'home_records_bloc.freezed.dart';
part 'home_records_state.dart';
part 'home_records_event.dart';

class HomeRecordsBloc {
  HomeRecordsBloc({required this.patientId, required this.patientRepository})
      : super(const HomeRecordsInitial()) {
    on<HomeRecordsFetchRequested>(_onFetchRequested);
  }

  final int patientId;

  final PatientRepository patientRepository;

  Future<void> _onFetchRequested(
      HomeRecordsFetchRequested event, Emitter emit) async {
    if (state is HomeRecordsFetching) return;
    emit(const HomeRecordsFetching());
    try {
      // patientDetails(patientId);
      final data = await patientRecords(patientId);
      emit(HomeRecordsReady(data: data));
    } catch (e) {
      emit(const HomeRecordsError());
    }
  }
}
