import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:neat/neat.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zanalys/user/models/user.dart';

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
  const _Hello({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final user = context.select((HelloBloc bloc) => bloc.state);
    final User? user = null; //context.select((HelloBloc bloc) => bloc.state);

    return context.shimmer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.bodyMedium(context.l10n.home_app_bar_subtitle),
          const SpaceSmaller.h(),
          FittedBox(
            child: Container(
              color: Colors.white,
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
