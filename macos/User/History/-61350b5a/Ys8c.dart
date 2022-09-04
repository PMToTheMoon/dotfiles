import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'professional_experience_form_snapshot.dart';

class ProfessionalExperienceFormController {
  ProfessionalExperienceFormController(
      {String? title,
      String? company,
      String? location,
      DateTime? startDate,
      DateTime? endDate,
      bool? ongoing,
      String? description})
      : title = TextEditingController(text: title),
        company = TextEditingController(text: company),
        location = TextEditingController(text: location),
        startDate = DateEditingController.yM(date: startDate),
        endDate = DateEditingController.yM(date: endDate),
        ongoing = CheckboxFieldController(ongoing),
        description = TextEditingController(text: description);

  ProfessionalExperienceFormController.fromSnapshot(
      ProfessionalExperienceFormSnapshot? initialValue)
      : title = TextEditingController(text: initialValue?.title),
        company = TextEditingController(text: initialValue?.company),
        location = TextEditingController(text: initialValue?.location),
        startDate = DateEditingController.yM(date: initialValue?.startDate),
        endDate = DateEditingController.yM(date: initialValue?.endDate),
        ongoing = CheckboxFieldController(initialValue?.ongoing),
        description = TextEditingController(text: initialValue?.description);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController title;

  final TextEditingController company;

  final TextEditingController location;

  final DateEditingController startDate;

  final DateEditingController endDate;

  final CheckboxFieldController ongoing;

  final TextEditingController description;

  bool validate() => formKey.currentState!.validate();

  ProfessionalExperienceFormSnapshot snapshot() =>
      ProfessionalExperienceFormSnapshot(
          title: title.text,
          company: company.text,
          location: location.text,
          startDate: startDate.date,
          endDate: endDate.date,
          ongoing: ongoing.value,
          description: description.text);

  ProfessionalExperienceFormSnapshot clear() =>
      title.text
company.text
location.text
startDate.date
endDate.date
ongoing.value
text,);
}
