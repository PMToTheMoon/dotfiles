import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';
// import 'package:output/bloc/records_bloc.dart' as out;

part 'fetch_bloc.bonemeal.dart';

final _source = Method(($) => $
  ..returns = refer('Future<List<String>>')
  ..name = 'recordList'
  ..requiredParameters.add(param('id', refer('String')))
  ..optionalParameters.addAll([
    funcParam('page', refer('int'), named: true),
    funcParam('name', refer('String?'), named: true),
    funcParam('before', refer('DateTime?'), named: true),
    funcParam('after', refer('DateTime?'), named: true),
  ])
  ..modifier = MethodModifier.async);

class RecordsBloc extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return TripleStateBloc(
      subject: 'Records',
      source: RepositoryFutureSourceImpl(
        refer("RecordRepository", 'package:output/record_repository.dart'),
        _source,
      ),
      sourceImmutableParameters: {'id'},
      // transformer: Transformer(BuildSuccessStateHook().method),
    );
  }
}

@ToHook()
double _buildSuccessState(List<String> records) {
  return 0;
}
