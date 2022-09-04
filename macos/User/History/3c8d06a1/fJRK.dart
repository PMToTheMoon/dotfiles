import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanalys/app/services.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.authenticated()) {
    on<HomeEventLogout>(_onLogout);
  }

  Future<void> _onLogout(HomeEventLogout event, Emitter<HomeState> emit) async {
    await AppServices.storage.clearSession();
    emit(const HomeState.unauthenticated());
  }

  logout() {
    add(HomeEventLogout());
  }
}
