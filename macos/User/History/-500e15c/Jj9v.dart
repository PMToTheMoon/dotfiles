import 'package:bloc/bloc.dart';

part 'observations_event.dart';
part 'observations_state.dart';

class ObservationsBloc extends Bloc<ObservationsEvent, ObservationsState> {
  ObservationsBloc() : super(ObservationsInitial()) {
    on<ObservationsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
