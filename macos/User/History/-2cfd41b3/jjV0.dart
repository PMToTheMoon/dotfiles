import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/form_field_controllers/tbt_text_field.dart';
import 'package:ipr/ipr.dart';

class ProfessionalExperiencesForm extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Form(subject: 'NewProfessionalExperience', parts: [
      TbtTextField(
        'title',
        label: 'professional_experience_form_title_label'.tr,
        hint: 'professional_experience_form_title_hint'.tr,
      ),
      TbtTextField('test2'),
    ]);
  }
}
