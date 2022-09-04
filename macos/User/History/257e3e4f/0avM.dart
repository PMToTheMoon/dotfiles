part 'home_records_bloc.freezed.dart';
part 'home_records_state.dart';
part 'home_records_event.dart';
class HomeRecordsBloc {
  HomeRecordsBloc({required this.patientId, required this.patientRepository}) :
   super(const HomeRecordsState()) { 
    on<HomeRecordsFetchRequested>(_onFetchRequested);
     }

final int patientId;

final PatientRepository patientRepository;

Future<void> _onFetchRequested(HomeRecordsFetchRequested event, Emitter emit) async  {
   if (state is HomeRecordsFetching) return;
emit(const const HomeRecordsState());
try {
  // patientDetails(patientId);
  final data = Instance of 'BinaryExpression';
  emit(HomeRecordsState(data: data));
} catch (e) {
  emit(const const HomeRecordsState());
}
 } 
 }
