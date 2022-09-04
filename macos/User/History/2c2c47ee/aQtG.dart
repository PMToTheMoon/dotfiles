import 'package:bonemeal/bonemeal.dart';

import 'candidate_information_form.dart';

final candidate = Path('candidate/', [
  Path('profile/user_details/widgets/', [
    candidateInformationFormController,
  ]),
]);
