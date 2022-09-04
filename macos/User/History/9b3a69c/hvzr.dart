import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:output/bloc/records_bloc.dart' deferred as out;

part 'fetch_bloc.bonemeal.dart';

final _source = Method(($) => $
  ..returns = refer('List<String>')
  ..name = 'recordList'
  ..optionalParameters.addAll([
    param('page', refer('int')),
    param('name', refer('String?')),
    param('before', refer('DateTime?')),
    param('after', refer('DateTime?')),
  ])
  ..modifier = MethodModifier.async);

class RecordsBloc extends Seed {
  @override
  MetaObject grow() {
    return SimpleFetchBloc(
      subject: 'Records',
      source: Source(
        refer("RecordRepository", 'package:output/record_repository.dart'),
        _source,
      ),
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

@ToHook()
extension DreamTest on RecordsBloc {
  double _buildSuccessState(List<String> rawRecords) {
    return 0;
  }
}
