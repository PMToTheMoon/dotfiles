import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';
// import 'package:output/bloc/records_bloc.dart' as out;

part 'fetch_bloc.bonemeal.dart';

final _source = Method(($) => $
  ..returns = refer('List<String>')
  ..name = 'recordList'
  ..requiredParameters.add(param('id', refer('String')))
  ..optionalParameters.addAll([
    param('page', refer('int')),
    param('name', refer('String?')),
    param('before', refer('DateTime?')),
    param('after', refer('DateTime?')),
  ])
  ..modifier = MethodModifier.async);

class AuthFetchBloc extends Seed {
  @override
  MetaObject grow() {
    return SimpleFetchBloc(
      subject: 'Records',
      source: Source(
        refer("RecordRepository", 'package:output/record_repository.dart'),
        _source,
      ),
      fields: {
        field('session', refer('String')),
      },
      initialStateValues: MapValueResolver({}),
      transformer: Transformer(BuildSuccessStateHook().method),
    );
  }
}

class RecordsBloc extends Seed {
  @override
  MetaObject grow() {
    return SimpleFetchBloc(
      subject: 'Records',
      source: Source(
        refer("RecordRepository", 'package:output/record_repository.dart'),
        _source,
      ),
      fields: {
        field('session', refer('String')),
      },
      defaultValues: {
        'page': literal(0),
      },
      transformer: Transformer(BuildSuccessStateHook().method),
    );
  }
}

@ToHook()
double _buildSuccessState(List<String> rawRecords) {
  return 0;
}
