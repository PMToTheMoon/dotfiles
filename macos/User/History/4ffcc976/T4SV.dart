import 'package:bonemeal/bonemeal.dart';

import 'cloture_complement_form.dart';
import 'new_complement_form.dart';
import 'new_rapport_form.dart';

final hub = Path('lib/record/hub/', [
  Path('observations/', [
    newRapportForm,
    newComplementForm,
    clotureComplementForm,
  ]),
]);
