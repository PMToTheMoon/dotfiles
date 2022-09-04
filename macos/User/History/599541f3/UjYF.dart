import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanalys/user/user_service.dart';

class HomeBloc extends Bloc<User?> {
  HomeBloc() : super(const HomeState());

  late final _userStreamSubscription;

  @override
  Future<void> dispose() async {
    await _userStreamSubscription.close();
    return super.dispose();
  }
}
