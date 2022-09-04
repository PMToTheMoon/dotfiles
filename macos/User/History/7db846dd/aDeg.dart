part of 'stream_view_bloc.dart';

const blocTemplate = """
import 'dart:async';

import 'package:bloc/bloc.dart';
import '{{ source.import }}';

class {{ bloc.class }} extends Cubit<{{ bloc.state.type }}> {
  {{ bloc.class }}({
    required {{ bloc.state.type }} initial,
    required Stream<{{ source.type }}> stream,
  }) : super(initial) {
    {{ bloc.subscription }} = {{ source.listener }};
  }

  late final StreamSubscription<{{ source.type }}> {{ bloc.subscription }};

  {{ source.transformer }}

  @override
  Future<void> close() async {
    await {{ bloc.subscription }}.cancel();
    return super.close();
  }
}
""";
