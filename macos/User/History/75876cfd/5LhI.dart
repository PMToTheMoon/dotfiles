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
    {{# handlers_declarations }}
    on<{{ events.fetchRequested }}>(_onFetchRequested);
  }

  {{ bloc.members }}

  {{ handlers }}
}
""";
