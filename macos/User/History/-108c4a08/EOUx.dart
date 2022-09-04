import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:output/record_repository.dart';
part 'records_state.dart';
part 'records_event.dart';
part 'records_bloc.freezed.dart';

class RecordsBloc extends Bloc<RecordsEvent, RecordsState> {
  RecordsBloc({required this.recordRepository})
      : super(const RecordsInitial()) {
    on<RecordsFetchRequested>(_onFetchRequested);
  }

  final RecordRepository recordRepository;

  _onFetchRequested(RecordsFetchRequested event, Emitter emit) async {
    if (state is RecordsLoading) return;
    emit(RecordsLoading(records: state.records));
    try {
      final rawRecords = await recordRepository.recordList();
      final success = _buildSuccessState(records);
      emit(success);
    } catch (e) {
      emit(RecordsError(records: state.records));
    }
  }

  double _buildSuccessState(List<String> rawRecords) {
    return 0;
  }
}
