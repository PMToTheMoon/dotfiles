part of 'fetch_bloc.dart';

const _blocTemplate = '''
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{ file_prefix }}_bloc.freezed.dart';
part '{{ file_prefix }}_state.dart';
part '{{ file_prefix }}_event.dart';

class {{ bloc_class }} extends Bloc<{{ event_class }}, {{ state_class }}> {
  {{ bloc_class }}({
    required this.{{ source.name }},
  }) : super(const {{ states.initial.class }}()) {
    on<{{ events.started.class }}>(_on{{ events.started.class }});
  }

  final {{ source.type }} {{ source.name }};

  Future<void> _on{{ events.started.class }}(
    {{ events.started.class }} event,
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

const _stateTemplate = r'''
part of '{{ file_prefix }}_bloc.dart';

@freezed
class {{ state_class }} with _${{ state_class }} {
  const factory {{ states.initial.ctr }}() = {{ states.initial.class }};

  const factory {{ states.fetching.ctr }}() = {{ states.fetching.class }};

  const factory {{ states.ready.ctr }}(
    {{ source.data.type }} {{ source.data.name }}
  ) = {{ states.ready.class }};

  const factory {{ states.error.ctr }}() = {{ states.error.class }};
}
''';

const _eventTemplate = r'''
part of '{{ file_prefix }}_bloc.dart';

@freezed
class {{ event_class }} with _${{ event_class }} {
  const factory {{ events.started.ctr }}() = {{ events.started.class }};
}
''';
