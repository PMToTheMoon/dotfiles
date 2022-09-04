import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';
// import 'package:output/bloc/records_bloc.dart' as out;

part 'fetch_bloc.bonemeal.dart';

final _source = Method(($) => $
  ..returns = refer('Future<List<String>>')
  ..name = 'recordList'
  ..requiredParameters.add(param('id', refer('String')))
  ..optionalParameters.addAll([
    param('page', refer('int')),
    param('name', refer('String?')),
    param('before', refer('DateTime?')),
    param('after', refer('DateTime?')),
  ])
  ..modifier = MethodModifier.async);

class RecordsBloc extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return ParametrizedFetchBloc(
      subject: 'Records',
      source: Source(
        refer("RecordRepository", 'package:output/record_repository.dart'),
        _source,
      ),
      fields: {
        field('id', refer('String')),
      },
      initialStateValues: MapValueResolver({
        // 'id': refer('session.id'),
        'page': literal(0),
      }),
      // transformer: Transformer(BuildSuccessStateHook().method),
    );
  }
}

@ToHook()
double _buildSuccessState(List<String> records) {
  return 0;
}
