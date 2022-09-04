import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

class Hook {
  const Hook(this.function);

  final dynamic Function(dynamic) function;
}

@Hook(() {})
final test = () {};

final b = MyBloc(
  postRecord: PostAction(
    'PostRecord',
    parameters: {
      'record': refer('...'),
    },
    target: myRepo.postRecord,
    transformer: (record) => recordToSend.from(record),
    success: (result) => SuccessState(result),
    error: (error) => ErrorState(result),
  ),
);

@Hook
Output hook(Input) {}
