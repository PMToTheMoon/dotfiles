import 'package:code_builder/code_builder.dart';

final b = MyBloc(
  postRecord: PostAction(
    parameters: {
      'record': refer('...'),
    },
  ),
);
