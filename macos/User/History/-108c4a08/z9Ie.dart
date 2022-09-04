import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:output/record_repository.dart';
part 'records_state.dart';
part 'records_event.dart';
part 'records_bloc.freezed.dart';

class RecordsBloc extends Bloc<RecordsEvent, RecordsState> {
  RecordsBloc({required this.recordRepository})
      : super(RecordsInitial(page: 0)) {
    on<RecordsFetchRequested>(_onFetchRequested);
  }

  final RecordRepository recordRepository;

  _onFetchRequested(RecordsFetchRequested event, Emitter emit) async {
    if (state is RecordsLoading) return;
    emit(RecordsLoading(records: state.records, page: state.page));
    try {
      final records = await recordRepository.recordList(page: state.page);
      emit(RecordsSuccess(records: records, page: state.page));
    } catch (e) {
      emit(RecordsError(records: state.records, page: state.page));
    }
  }


  _fetch(Emitter emit) {}

  _onXFilterChanged(filterChangedEvent event, Emitter emit) {
    final newState = state.copyWith(event.value);
    emit(state);
    if (filter2 != null) _refetch;
    else _retransform
  }
}
