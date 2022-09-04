import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_by_tech/user/user_repository.dart';

part 'user_account_event.dart';
part 'user_account_state.dart';
part 'user_account_bloc.freezed.dart';

class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  UserAccountBloc() : super(_Initial()) {
    on<UserAccountEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final UserRepository userRepository;
}
