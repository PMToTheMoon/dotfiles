part of 'bloc.dart';

const blocTemplate = """
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
{{ headers }}

part '{{ freezed_file }}';
part '{{ event.file }}';
part '{{ state.file }}';

class {{ class }} extends Bloc<{{ event.class }}, {{ state.class }}> {
  {{ class }}{{ parameters }} : super(const {{ states.initial }}()) {
    on<{{ events.fetchRequested }}>(_onFetchRequested);
  }

  {{ members }}

  {{ handlers }}
}
""";
