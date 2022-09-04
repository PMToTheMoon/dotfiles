const subStreamCubit = """
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:zanalys/user/user_service.dart';

class HelloBloc extends Cubit<{{ source.type }}> {
  HelloBloc({
    required Stream<{{ source.type }}> userService,
  }) : super(userService.user) {
    _userStreamSubscription = userService.userStream.listen(emit);
  }

  late final StreamSubscription<User> _userStreamSubscription;

  @override
  Future<void> close() async {
    await _userStreamSubscription.cancel();
    return super.close();
  }
}
""";
