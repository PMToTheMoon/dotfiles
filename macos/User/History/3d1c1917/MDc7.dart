import 'package:code_builder/code_builder.dart';

final b = MyBloc(
  postRecord: PostAction(
    parameters: {
      'record': refer('...'),
    },
    target: myRepo.postRecord,
    transformer: (record) => recordToSend.from(record),
    success: (result) => state(result),
    error: (error) => state(result),
  ),
);
