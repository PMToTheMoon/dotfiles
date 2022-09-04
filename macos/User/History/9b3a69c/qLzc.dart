import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';
// import 'package:output/bloc/records_bloc.dart' as out;

part 'fetch_bloc.bonemeal.dart';

final _source = Method(($) => $
  ..returns = refer('List<String>')
  ..name = 'recordList'
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
      // hook: BuildSuccessStateHook(),
    );
  }
}

@ToHook()
double _buildSuccessState(List<String> records) {
  return 0;
}
