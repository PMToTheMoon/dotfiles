part of 'bloc.dart';

const blocTemplate = """
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
{{ headers }}

part '{{ bloc.freezed_file }}';
part '{{ bloc.event.file }}';
part '{{ bloc.state.file }}';

class {{ bloc.class }} extends Bloc<{{ bloc.event.class }}, {{ bloc.state.class }}> {
  {{ bloc.class }}{{ bloc.parameters }} : super(const {{ states.initial }}()) {
    on<{{ events.fetchRequested }}>(_onFetchRequested);
  }

  {{ bloc.members }}

  Future<void> _onFetchRequested(
    {{ events.fetchRequested }} event,
    Emitter emit,
  ) async {
    if (state is {{ states.fetching }}) return;
    emit(const {{ states.fetching }}());
    try {
      // patientDetails(patientId);
      final data = await {{ source.fetch }};
      emit({{ states.ready }}(details: data));
    } catch (e) {
      emit(const {{ states.error }}());
    }
  }
}
""";
