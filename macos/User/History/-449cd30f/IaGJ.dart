import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanalys/app/app_services.dart';
import 'package:zanalys/splash/bloc/splash_event.dart';
import 'package:zanalys/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.unknown()) {
    on<SplashEventFetchSession>(_onFetchSession);
  }

  Future<void> _onFetchSession(
      SplashEventFetchSession event, Emitter<SplashState> emit) async {
    String? token = await AppServices.storage.getRefreshToken();
    if (token != null && token.isNotEmpty) {
      emit(const SplashState.authenticated());
    } else {
      emit(const SplashState.unauthenticated());
    }
  }

  fetchUserAuthenticated() {
    add(SplashEventFetchSession());
  }
}
