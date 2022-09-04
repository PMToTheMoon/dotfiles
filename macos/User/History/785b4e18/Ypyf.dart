import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

import 'record/general/initial_observation_form.dart';
import 'common/observation_card_data.dart';

Future<void> main() async {
  await build((BuildStep step) async {
    await step.build(generalInitialObservationForm);
    await step.build(observationCardDataPart);
  });
}
