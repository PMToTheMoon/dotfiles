import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
part 'records_state.dart';
part 'records_event.dart';
part 'records_bloc.freezed.dart';

class RecordsBloc extends Bloc<RecordsEvent, RecordsState> {
  RecordsBloc({required this.field1, required this.field2})
      : super(const RecordsInitial()) {
    on<RecordsFetchRequested>(_onFetchRequested);
  }

  final int field1;

  final String field2;

  _onFetchRequested(RecordsFetchRequested event, Emitter emit) {
    print('Hellow world');
  }
}

mixin Test on Bloc {
  _fetchMethod() {
    if (state is PatientListFetching) return;
    emit(const PatientListFetching());
    try {
      final data = await patientRepository.list();
      emit(PatientListReady(data));
    } catch (e) {
      emit(const PatientListError());
    }  
  }
}