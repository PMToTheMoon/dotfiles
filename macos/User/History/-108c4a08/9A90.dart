// ignore_fo_file: undefined_identifier
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:output/record_repository.dart';
part 'records_state.dart';
part 'records_event.dart';
part 'records_bloc.freezed.dart';

class RecordsBloc extends Bloc<RecordsEvent, RecordsState> {
  RecordsBloc({required this.recordRepository})
      : super(
            RecordsInitial(page: 0, name: name, before: before, after: after)) {
    on<RecordsFetchRequested>(_onFetchRequested);
    on<RecordsPageChanged>(_onPageChanged);
    on<RecordsNameChanged>(_onNameChanged);
    on<RecordsBeforeChanged>(_onBeforeChanged);
    on<RecordsAfterChanged>(_onAfterChanged);
  }

  final RecordRepository recordRepository;

  _onFetchRequested(RecordsFetchRequested event, Emitter emit) async {
    if (state is RecordsLoading) return;
    emit(RecordsLoading(
        records: state.records,
        page: state.page,
        name: state.name,
        before: state.before,
        after: state.after));
    try {
      final records = await recordRepository.recordList(
          page: state.page,
          name: state.name,
          before: state.before,
          after: state.after);
      final success = _buildSuccessState(records);
      emit(success);
    } catch (e) {
      emit(RecordsError(
          records: state.records,
          page: state.page,
          name: state.name,
          before: state.before,
          after: state.after));
    }
  }

  _onPageChanged(RecordsPageChanged event, Emitter emit) {
    emit(state.copyWith(page: event.page));
    add(const RecordsFetchRequested());
  }

  _onNameChanged(RecordsNameChanged event, Emitter emit) {
    emit(state.copyWith(name: event.name));
    add(const RecordsFetchRequested());
  }

  _onBeforeChanged(RecordsBeforeChanged event, Emitter emit) {
    emit(state.copyWith(before: event.before));
    add(const RecordsFetchRequested());
  }

  _onAfterChanged(RecordsAfterChanged event, Emitter emit) {
    emit(state.copyWith(after: event.after));
    add(const RecordsFetchRequested());
  }

  double _buildSuccessState(List<String> records) {
    return 0;
  }
}
