import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'user_personal_information_event.dart';
part 'user_personal_information_state.dart';
part 'user_personal_information_bloc.freezed.dart';

class UserPersonalInformationBloc
    extends Bloc<UserPersonalInformationEvent, UserPersonalInformationState> {
  UserPersonalInformationBloc()
      : super(const UserPersonalInformationState.initial()) {
    on<UserPersonalInformationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
