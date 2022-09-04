import 'package:flutter/material.dart';

import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:zanalys/record/hub/hub.dart';
import 'package:zanalys/record/initial_observation/bloc/initial_observation_bloc.dart';
import 'widgets/general_initial_observation_form.dart';

class GeneralInitialObservationPage extends StatelessWidget {
  static MaterialPageRoute materialPageRoute(
    BuildContext context, {
    required Record record,
  }) =>
      MaterialPageRoute(
        builder: (ctx) => const GeneralInitialObservationPage(),
      );

  const GeneralInitialObservationPage({
    super.key,
  });

  void _onStateChanged(BuildContext context, InitialObservationState state) {
    if (state is InitialObservationSuccess) {
      Navigator.of(context).pushAndRemoveUntil(HubPage.materialPageRoute(recordId: recordId), (r) => r.isFirst,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitialObservationBloc(),
      child: const BlocListener<InitialObservationBloc, InitialObservationState>(
        listener: 
        child: _GeneralInitialObservationPage(),
      ),
    );
  }
}

class _GeneralInitialObservationPage extends StatefulWidget {
  const _GeneralInitialObservationPage();

  @override
  State<_GeneralInitialObservationPage> createState() =>
      _GeneralInitialObservationPageState();
}

class _GeneralInitialObservationPageState
    extends State<_GeneralInitialObservationPage> {
  final _formController = GeneralInitialObservationFormController();

  void _onValidate() {
    if (_formController.validate()) {
      context
          .read<InitialObservationBloc>()
          .add(const InitialObservationEvent.submitted());
      // Navigator.of(context).pushReplacement(
      //   HubPage.materialPageRoute(
      //     patient: const Patient(
      //       id: 'UP339271529800',
      //       firstName: 'Leclerc',
      //       lastName: 'Charles',
      //     ),
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((InitialObservationBloc bloc) => bloc.state);

    return OverlayLoadingIndicator(
      loading: state is InitialObservationPost,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: titleSubtitleAvatarAppBar(
          context,
          title: context.l10n.initial_observation_page_title,
          subtitle: context.l10n.record_type_general,
          image: AssetImage(Assets.images.launcherIcon.keyName),
        ),
        body: Padding(
          padding: const PaddingSmall.horizontal(),
          child: SingleChildScrollView(
            child: FormAutoScroll(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SpaceSmall.h(),
                  GeneralInitialObservationForm(
                    controller: _formController,
                    spacing: const SpaceSmall.h(),
                  ),
                  const SpaceSmall.h(),
                  ElevatedButton(
                    onPressed: _onValidate,
                    child: Text(context.l10n.validate_initial_observation),
                  ),
                  const SpaceSmall.h(),
                  const KeyboardSpace(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
