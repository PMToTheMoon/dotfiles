import 'package:bloc/bloc.dart';

part 'my_fetch_bloc_bloc.freezed.dart';
part 'my_fetch_bloc_state.dart';
part 'my_fetch_bloc_event.dart';

class MyFetchBlocBloc extends Bloc<MyFetchBlocEvent, MyFetchBlocState> {
  MyFetchBlocBloc({required this.field1, required this.field2})
      : super(const MyFetchBlocInitial()) {
    on<MyFetchBlocStarted>(_onStarted);
  }

  final int field1;

  final String field2;
}
