part of 'stream_sub_cubit.dart';

const blocTemplate = """
import 'dart:async';

import 'package:bloc/bloc.dart';
import '{{ source.import }}';

class {{ bloc.class }} extends Cubit<{{ bloc.state.type }}> {
  {{ bloc.class }}({
    required {{ bloc.state.type }} initial,
    required Stream<{{ source.type }}> stream,
  }) : super(initial) {
    _userStreamSubscription = stream.listen(emit);
  }

  late final StreamSubscription<{{ source.type }}> _userStreamSubscription;


  {{ source.transformer }}

  @override
  Future<void> close() async {
    await _userStreamSubscription.cancel();
    return super.close();
  }
}
""";
