import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

final b = MyBloc(
  postRecord: PostAction(
    'PostRecord',
    parameters: {
      'record': refer('...'),
    },
    target: myRepo.postRecord,
    transformer: @Hook (record) => recordToSend.from(record),
    success: (result) => SuccessState(result),
    error: (error) => ErrorState(result),
  ),
);

@Hook
Output hook(Input) {}
