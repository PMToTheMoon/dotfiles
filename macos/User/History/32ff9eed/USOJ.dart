import 'package:output/bloc/records_bloc.dart' as out;
part 'test.bonemeal.dart';

@ToHook()
extension RecordsBlocTransformer {
  @Entrypoint()
  out.RecordsSuccess _buildSuccessState(
    out.RecordsState state,
    List<String> records,
  ) {
    return out.RecordsSuccess(
      records: records,
    );
  }
}
