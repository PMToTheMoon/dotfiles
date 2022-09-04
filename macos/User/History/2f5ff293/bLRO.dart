import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/create_record_bloc.dart';

class CreateRecordPage extends StatelessWidget {
  static MaterialPageRoute materialPageRoute() =>
      MaterialPageRoute(builder: (context) => const CreateRecordPage());

  static Future open(BuildContext context) => Navigator.of(context).push(
        materialPageRoute(),
      );

  const CreateRecordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateRecordBloc(),
      child: Scaffold(
        body: BlocBuilder<CreateRecordBloc, CreateRecordState>(
          builder: (context, state) => state.map(
            initial: initial,
            create: create,
            success: success,
            error: error,
          ),
        ),
      ),
    );
  }
}
