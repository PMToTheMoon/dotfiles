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
    if (state is! {{ states.fetching.class }}) {
      emit(const {{ states.fetching.class }}());
      try {
        final data = await {{ source.name }}.{{ source.fetch_function }}();
        emit({{ states.ready.class }}(data));
      } catch (e) {
        emit(const {{ states.error.class }}());
      }
    }
  }
}
''';

const _blocStateTamplate = r'''
part of 'patient_list_bloc.dart';

@freezed
class {{ bloc_subject }}State with _${{ bloc_subject }}State {
  const factory {{ bloc_subject }}.initial() = {{ bloc_subject }};

  const factory {{ bloc_subject }}.fetching() = {{ bloc_subject }}Fetching;

  const factory {{ bloc_subject }}.ready({
    required Data data,
  }) = {{ bloc_subject }}Ready;

  const factory {{ bloc_subject }}.error() = {{ bloc_subject }}Error;
}
''';
