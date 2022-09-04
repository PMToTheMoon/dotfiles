import 'package:bonemeal/bonemeal.dart';

import 'api_models/api_models.dart';
import 'models/models.dart';
import 'record/general/initial_observation_form.dart';
import 'hub/observation_card_data.dart';
import 'record/hub/hub.dart';

Future<void> main() async {
  await build(Seeds([
    generalInitialObservationForm,
    observationCardDataPart,
    hub,
    models,
    apiModels,
  ]));
}
