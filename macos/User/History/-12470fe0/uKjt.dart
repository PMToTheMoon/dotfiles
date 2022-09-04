import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated_bloc.freezed.dart';
part 'generated_bloc_state.dart';
part 'generated_bloc_event.dart';

class SubjectBloc extends StateMachine<SubjectBlocEvent, SubjectBlocState> {}
