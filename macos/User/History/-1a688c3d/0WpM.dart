import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/hub/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: homeAppBar(context, firstName: 'John', showAlertBadge: true),
        body: Column(
          children: [
            Row(
              children: [
                HomeActionCard(
                  icon: Icons.perm_identity,
                  text: 'Céer un patient',
                  color: context.colorScheme.primary,
                  backgroundColor: context.colorScheme.primaryContainer,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
