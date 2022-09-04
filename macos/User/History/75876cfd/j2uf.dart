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
    {{# handlers.registration }}
    on<{{ events.fetchRequested }}>(_onFetchRequested);
    {{/ handlers.registration }}
  }

  {{ bloc.members }}

  {{ handlers.definitions }}
}
""";
