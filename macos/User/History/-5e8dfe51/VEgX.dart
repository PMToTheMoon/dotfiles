import 'package:bloc_generators/src/bloc/bloc.dart';
import 'package:bonemeal/bonemeal.dart';

class FetchBloc extends Bloc {
  FetchBloc({
    required super.subject,
    required this.fetchType,
    this.defaultValues,
    Set<Field> parameters = const {},
    Set<Field> fetchContextualData = const {},
  })  : fetchContextualData = Fields(fetchContextualData),
        super(
          parameters: Fields({
            ...parameters,
            ...fetchContextualData,
          }),
          states: {
            'initial': {
              ...fetchContextualData,
            },
            'loading': {
              fetchType.toNullable(),
              ...fetchContextualData,
            },
            'success': {
              fetchType.toNullable(),
              ...fetchContextualData,
            },
            'error': {
              fetchType.toNullable(),
              ...fetchContextualData,
            },
          },
          events: {
            'fetchRequested': {},
          },
        );

  final Field fetchType;
  final Fields fetchContextualData;
  final Map<String, Expression>? defaultValues;

  @override
  InvokeExpression initialState(FreezedMetaData states) {
    return states.types['initial']!.$class.invoke(
      values: MapValueResolver(
        defaultValues ?? {},
      ),
    );
  }

  @override
  Iterable<Method> methods(BuildStep context) {
    return [
      _fetchMethod(),
    ];
  }

  Method _fetchMethod() {
//     final body = '''
// if (state is ${state('loading').symbol}) return;
// emit(${state('loading').invoke.code});
// try {
//   final data = await patientRepository.list();
//   emit(PatientListReady(data));
// } catch (e) {
//   emit(const PatientListError());
// }
// ''';

    final body = [
      Code('if (state is ${state('loading').symbol}) return;'),
      refer('emit').call([
        state('loading').invoke(DelegateValueResolver(() {          fetchType.name: refer('state.${fetchType.name}'),
          for (final d in fetchContextualData) d.name: refer('state.${d.name}')
        }),
      ]).statement,
    ];

    final handler = eventHandler('fetchRequested')..body = Block.of(body);
    return handler.build();
  }
}
