import 'package:bloc/bloc.dart';
import 'package:zanalys/user/user_service.dart';

class HomeBloc extends Cubit<User?> {
  HomeBloc({
    required UserService userService,
  }) : super(userService.user);

  late final _userStreamSubscription;

  @override
  Future<void> close() async {
    await _userStreamSubscription.close();
    return super.close();
  }
}
