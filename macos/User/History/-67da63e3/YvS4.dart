part of 'fetch_bloc.dart';

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
      emit({{ states.ready.new }});
    } catch (e) {
      emit(const {{ states.error.new }});
    }
  }
''';
