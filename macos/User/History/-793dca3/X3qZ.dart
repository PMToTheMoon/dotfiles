const subStreamCubit = """
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:zanalys/user/user_service.dart';

class HelloBloc extends Cubit<{{ source.type }}> {
  HelloBloc({
    required {{ source.type }} initial,
    required Stream<{{ source.type }}> stream,
  }) : super(initial) {
    _userStreamSubscription = stream.listen(emit);
  }

  late final StreamSubscription<{{ source.type }}> _userStreamSubscription;

  @override
  Future<void> close() async {
    await _userStreamSubscription.cancel();
    return super.close();
  }
}
""";
