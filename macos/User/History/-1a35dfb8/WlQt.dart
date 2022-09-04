import 'package:bloc/bloc.dart';

import 'package:zanalys/record/add_doctor/bloc/doctor_list_bloc.dart';

part 'record_doctors_event.dart';
part 'record_doctors_state.dart';

class RecordDoctorsBloc extends Bloc<RecordDoctorsEvent, RecordDoctorsState> {
  RecordDoctorsBloc() : super(RecordDoctorsInitial()) {
    on<RecordDoctorsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
