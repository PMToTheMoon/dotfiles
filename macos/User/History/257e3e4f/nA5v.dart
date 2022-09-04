import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:output/records/records_repository.dart';
import 'package:bloc/bloc.dart';
part 'home_records_bloc.freezed.dart';
part 'home_records_state.dart';
part 'home_records_event.dart';

class HomeRecordsBloc extends Bloc<HomeRecordsEvent, HomeRecordsState> {
  HomeRecordsBloc({required this.patientId, required this.recordsRepository})
      : super(const HomeRecordsInitial()) {
    on<HomeRecordsFetchRequested>(_onFetchRequested);
  }

  final int patientId;

  final RecordsRepository recordsRepository;

  Future<void> _onFetchRequested(
      HomeRecordsFetchRequested event, Emitter emit) async {
    if (state is HomeRecordsFetching) return;
    emit(const HomeRecordsFetching());
    try {
      // patientDetails(patientId);
      final data = await recordsRepository.patientRecords(patientId);
      emit(HomeRecordsReady(data: data));
    } catch (e) {
      emit(const HomeRecordsError());
    }
  }
}
