import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/form_field_controllers/tbt_text_field.dart';

class ProfessionalExperiencesForm extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Form(subject: 'NewProfessionalExperience', parts: [
      TbtTextField('test'),
      TbtTextField('test2'),
    ]);
  }
}
