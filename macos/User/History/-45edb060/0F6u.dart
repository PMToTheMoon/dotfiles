part of 'fetch_bloc.dart';

const _blocTemplate = '''
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{ file_prefix }}_bloc.freezed.dart';
part '{{ file_prefix }}_state.dart';
part '{{ file_prefix }}_event.dart';

class {{ bloc_subject }}Bloc extends Bloc<{{ bloc_subject }}Event, {{ bloc_subject }}State> {
  {{ bloc_subject }}Bloc({
    required this.{{ source.name }},
  }) : super(const {{ states.initial }}()) {
    on<{{ events.fetch_requested }}>(_on{{ events.fetch_requested }});
  }

  final {{ source.type }} {{ source.name }};

  Future<void> _on{{ events.fetch_requested }}(
    {{ events.fetch_requested }} event,
    Emitter emit,
  ) async {
    if (state is! {{ states.fetching }}) {
      emit(const {{ states.fetching }}());
      try {
        final data = await {{ source.name }}.{{ source.fetch_function }}();
        emit({{ states.ready }}(data));
      } catch (e) {
        emit(const {{ states.error }}());
      }
    }
  }
}
''';

const _blocStateTamplate = '''
part of 'patient_list_bloc.dart';

@freezed
class PatientListState with _$PatientListState {
  const factory PatientList.initial() = PatientListInitial;

  const factory PatientList.fetching() = PatientListFetching;

  const factory PatientList.ready({
    required Data data,
  }) = PatientListReady;

  const factory PatientList.error() = PatientListError;
}
''';
