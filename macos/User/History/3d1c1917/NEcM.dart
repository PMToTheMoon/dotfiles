import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

class Hook {
  const Hook();
}

@Hook()
extension on RecordToSend {
  void _error() {}
}

final b = MyBloc(
  postRecord: PostAction(
    'PostRecord',
    parameters: {
      'record': refer('...'),
    },
    target: myRepo.postRecord,
    transformer: (record) => recordToSend.from(record),
    success: (result) => SuccessState(result),
    error: _$error,
  ),
);

@Hook
Output hook(Input) {}
