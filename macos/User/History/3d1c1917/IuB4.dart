import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

class Hook {
  const Hook();
}

@Hook()
extension on MyBloc {
  void onSuccess(Result result) {
    emit(NewState());
  }
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
