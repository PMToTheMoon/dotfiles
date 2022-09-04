import 'package:bloc/bloc.dart';
import 'package:models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_record_event.dart';
part 'create_record_state.dart';

class CreateRecordBloc extends Bloc<CreateRecordEvent, CreateRecordState> {
  CreateRecordBloc() : super(CreateRecordInitial()) {
    on<CreateRecordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
