part of 'bloc.dart';

const blocTemplate = """
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{ bloc.freezed_file }}';
part '{{ bloc.event.file }}';
part '{{ bloc.state.file }}';

class {{ bloc.class }} extends Bloc<{{ bloc.event.class }}, {{ bloc.state.class }}> {
  {{ bloc.class }}{{ bloc.parameters }} : super({{ initial_state }}) {
    {{# handlers.registrations }}
    on<{{ class }}>({{ handler }});
    {{/ handlers.registrations }}
  }

  {{ bloc.members }}

  {{ handlers.definitions }}
}
""";
