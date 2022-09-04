import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_list_bloc.freezed.dart';
part '_patient_list_state.dart';
part '_patient_list_event.dart';

class API {
  Future<int> fetch() async => 0;
}

class PatientListBloc extends Bloc<PatientListEvent> {
  PatientListBloc({
    required this.sourceAPI,
  }) : super(PatientListFetching()) {
    define<PatientListCanFetch>(($) => $
      ..on<PatientFetchRequested>(_toFetching)
      ..define<PatientListReady>()
      ..define<PatientListError>());

    define<PatientListFetching>(($) => $
      ..onEnter(_fetch)
      ..on<PatientFetchSucceed>(_toReady)
      ..on<PatientListFetchFailed>(_toError));
  }

  final API sourceAPI;

  PatientListFetching _toFetching(e, s) => PatientListFetching();

  PatientListReady _toReady(PatientFetchSucceed e, s) =>
      PatientListReady(e.data);

  PatientListError _toError(PatientListFetchFailed e, s) => PatientListError();

  Future<void> _fetch(PatientListFetching s) async {
    try {
      final data = await sourceAPI.fetch();
      add(PatientFetchSucceed(data));
    } catch (e) {
      add(PatientListFetchFailed());
    }
  }
}
