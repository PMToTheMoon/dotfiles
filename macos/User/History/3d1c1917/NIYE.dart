import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

class Hook {
  const Hook();
}

@Hook()
extension on MyBloc {
  void onSuccess(Result result) {
    emit(NewState(result: result));
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
    success: _$onSuccess,
    error: _$error,
  ),
);

@Hook
Output hook(Input) {}

class MyBloc extends Seed with _$MyBloc {
  @Hook()
  void onSuccess(Result result) {
    emit(NewState(result: result));
  }

  MetaObject grow() {
    return Bloc(
      capabilities: [
        Post(
          'PostRecord',
          parameters: {
            'record': refer('...'),
          },
          target: myRepo.postRecord,
          transformer: (record) => recordToSend.from(record),
          success: _$onSuccess,
          error: _$error,
        ),
      ],
    );
  }
}
