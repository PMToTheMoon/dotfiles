import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_consultation_request_event.dart';
part 'doctor_consultation_request_state.dart';

class DoctorConsultationRequestBloc extends Bloc<DoctorConsultationRequestEvent,
    DoctorConsultationRequestState> {
  DoctorConsultationRequestBloc() : super(DoctorConsultationRequestInitial()) {
    on<DoctorConsultationRequestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
