part of 'stream_sub_cubit.dart';

const bloc = """
import 'dart:async';

import 'package:bloc/bloc.dart';
import '{{ source.import }}';

class {{ bloc.class }} extends Cubit<{{ source.type }}> {
  {{ bloc.class }}({
    required {{ source.type }} initial,
    required Stream<{{ source.type }}> stream,
  }) : super(initial) {
    _userStreamSubscription = stream.listen(emit);
  }

  late final StreamSubscription<{{ source.type }}> _userStreamSubscription;

  @override
  Future<void> close() async {
    await _userStreamSubscription.cancel();
    return super.close();
  }
}
""";
