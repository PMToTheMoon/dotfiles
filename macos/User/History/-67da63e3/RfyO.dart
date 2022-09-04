part of 'fetch_bloc.dart';

// const blocTemplate = """
// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:zanalys/patient/models/patient_details.dart';
// import 'package:zanalys/patient/patient_service.dart';

// part '{{ bloc.freezed_file }}';
// part '{{ bloc.event.file }}';
// part '{{ bloc.state.file }}';

// class {{ bloc.class }} extends Bloc<{{ bloc.event.class }}, {{ bloc.state.class }}> {
//   {{ bloc.class }}({
//     required this.patientId,
//     required this.{{ source.name }},
//   }) : super(const {{ states.initial }}()) {
//     on<{{ events.fetchRequested }}>(_onFetchRequested);
//   }

//   final String patientId;
//   final {{ source.fetch }} {{ source.name }};

//   Future<void> _onFetchRequested(
//     {{ events.fetchRequested }} event,
//     Emitter emit,
//   ) async {
//     if (state is {{ states.fetching }}) return;
//     emit(const {{ states.fetching }}());
//     try {
//       // patientDetails(patientId);
//       final data = await {{ source.fetch }};
//       emit({{ states.ready }}(details: data));
//     } catch (e) {
//       emit(const {{ states.error }}());
//     }
//   }
// }
// """;

const fetchHandlerTemplate = '''
Future<void> _onFetchRequested(
    {{ events.fetchRequested.class }} event,
    Emitter emit,
  ) async {
    if (state is {{ states.fetching.class }}) return;
    emit(const {{ states.fetching.new }});
    try {
      // patientDetails(patientId);
      final data = await {{ source.fetch }};
      emit({{ states.ready.class }}(details: data));
    } catch (e) {
      emit(const {{ states.error.new }});
    }
  }
''';
