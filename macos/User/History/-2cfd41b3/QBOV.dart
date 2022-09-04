import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:ipr/form_field_controllers/tbt_text_field.dart';
import 'package:ipr/ipr.dart';

Expression _fieldTr(String s) => 'professional_experience_form_$s'.tr;

class ProfessionalExperiencesForm extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Form(subject: 'NewProfessionalExperience', parts: [
      TbtTextField(
        'title',
        label: _fieldTr('title_label'),
        hint: _fieldTr('title_hint'),
      ),
      TbtTextField(
        'company',
        label: _fieldTr('company_label'),
        hint: _fieldTr('company_hint'),
      ),
      TbtTextField(
        'location',
        label: _fieldTr('location_label'),
        hint: _fieldTr('location_hint'),
      ),
      TbtTextField(
        'startDate',
        label: _fieldTr('start_date'),
      ),
      TbtTextField(
        'endDate',
        label: _fieldTr('end_date'),
      ),
      TbtTextField(
        'location',
        label: _fieldTr('location_label'),
        hint: _fieldTr('location_hint'),
      ),
    ]);
  }
}
