import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:neat/neat.dart';

import 'bloc/hello_bloc.dart';

class Hello extends StatelessWidget {
  const Hello({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HelloBloc(
        userService: GetIt.I.get(),
      ),
      child: const _Hello(),
    );
  }
}

class _Hello extends StatelessWidget {
  const _Hello();

  @override
  Widget build(BuildContext context) {
    final user = context.select((HelloBloc bloc) => bloc.state);

    return SharedShimmer(
      enabled: user == null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerText(
            fontSize: 12,
            width: 60,
            child: context.bodyMedium(context.l10n.home_app_bar_subtitle),
          ),
          ShimmerText(
            fontSize: 20,
            child: FittedBox(
              child: context.headlineLarge(
                context.l10n.home_app_bar_title(user?.firstName ?? 'John'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
