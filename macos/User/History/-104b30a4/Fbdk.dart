import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

import 'api_models/api_models.dart';
import 'models/models.dart';
import 'record/general/initial_observation_form.dart';
import 'hub/observation_card_data.dart';

Future<void> main() async {
  await buildAll([
    generalInitialObservationForm,
    observationCardDataPart,
    models,
    apiModels,
  ]);
}
