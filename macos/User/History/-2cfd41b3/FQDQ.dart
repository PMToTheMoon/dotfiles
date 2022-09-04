import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/form_field_controllers/date_picker_field.dart';
// import 'package:ipr/form_field_controllers/tbt_text_field.dart';
import 'package:ipr/ipr.dart';

// Expression _fieldTr(String s) => 'professional_experience_form_$s'.tr;

class ProfessionalExperiencesForm extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return FormController(
      formName: 'ProfessionalExperienceForm',
      fields: [
        FormControllerField(
          'title',
          controller: const TextFormFieldController(),
        ),
        FormControllerField(
          'company',
          controller: const TextFormFieldController(),
        ),
        FormControllerField(
          'location',
          controller: const TextFormFieldController(),
        ),
        FormControllerField(
          'startDate',
          controller: DatePickerFieldController(),
        ),
        FormControllerField(
          'endDate',
          controller: DatePickerFieldController(),
        ),
        FormControllerField(
          'ongoing',
          controller: CheckboxFieldController(),
        ),
        FormControllerField(
          'description',
          controller: const TextFormFieldController(),
        ),
      ],
    );
  }
}
