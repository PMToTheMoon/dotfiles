import 'package:bloc/bloc.dart';
import 'package:zanalys/user/user_service.dart';

class HomeBloc extends Cubit<User?> {
  HomeBloc({
    required UserService userService,
  })  : _userStreamSubscription = userService.userStream.listen((event) {}),
        super(userService.user);

  final _userStreamSubscription;

  void _onUserReceived(User user) => emit(user);

  @override
  Future<void> close() async {
    await _userStreamSubscription.close();
    return super.close();
  }
}
