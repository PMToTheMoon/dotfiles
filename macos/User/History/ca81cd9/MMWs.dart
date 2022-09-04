import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';
import 'package:intl/intl.dart';

export 'professional_experience_form_snapshot.dart';

import 'professional_experience_form_controller.dart';

class ProfessionalExperienceForm extends StatefulWidget {
  const ProfessionalExperienceForm({
    this.onWillPop,
    this.onChanged,
    this.autovalidateMode,
    Widget? spacing,
    this.controller,
    super.key,
  }) : spacing = spacing ?? const SizedBox.shrink();

  final WillPopCallback? onWillPop;

  final VoidCallback? onChanged;

  final AutovalidateMode? autovalidateMode;

  final Widget spacing;

  final ProfessionalExperienceFormController? controller;

  @override
  ProfessionalExperienceFormState createState() =>
      ProfessionalExperienceFormState();
}

class ProfessionalExperienceFormState
    extends State<ProfessionalExperienceForm> {
  ProfessionalExperienceFormState();

  late final _controller =
      widget.controller ?? ProfessionalExperienceFormController();

  bool _isExperienceOngoing = false;

  Validator<DateTime> get _endDateValidator {
    return Validators.compose([
      Validators.required(context),
      (value) {
        final dateStr = _controller.endDate.text;
        if (dateStr.isEmpty) return context.l10n.form_error_empty_field;
        try {
          final parsedDate = DateFormat.yM().parseStrict(dateStr);
          final startDate = _controller.startDate.date;
          if (startDate != null) {
            if (parsedDate.isAfter(startDate) == false) {
              return context.l10n.form_error_date_is_not_after(startDate);
            }
          }
          return null;
        } catch (e) {
          return 'invalide date format';
        }
      },
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      onWillPop: widget.onWillPop,
      autovalidateMode: widget.autovalidateMode,
      key: _controller.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 500,
            child: Column(
              children: [
                TbtTextFormField(
                  controller: _controller.title,
                  textInputAction: TextInputAction.next,
                  validator: Validators.required(context),
                  decoration: InputDecoration(
                    errorMaxLines: 3,
                    labelText:
                        context.l10n.professional_experience_form_title_label,
                    hintText:
                        context.l10n.professional_experience_form_title_hint,
                  ),
                ),
                const SpaceSmall.h(),
                TbtTextFormField(
                    controller: _controller.company,
                    textInputAction: TextInputAction.next,
                    validator: Validators.required(context),
                    decoration: InputDecoration(
                        errorMaxLines: 3,
                        labelText: context
                            .l10n.professional_experience_form_company_label,
                        hintText: context
                            .l10n.professional_experience_form_company_hint)),
                const SpaceSmall.h(),
                TbtTextFormField(
                  controller: _controller.location,
                  textInputAction: TextInputAction.next,
                  validator: Validators.required(context),
                  decoration: InputDecoration(
                    errorMaxLines: 3,
                    labelText: context
                        .l10n.professional_experience_form_location_label,
                    hintText:
                        context.l10n.professional_experience_form_location_hint,
                  ),
                ),
              ],
            ),
          ),
          const SpaceSmall.h(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 145,
                    child: DatePickerFormField(
                        controller: _controller.startDate,
                        // validator: Validators.required(context),
                        validator: (v) {
                          return null;
                        },
                        label: context.l10n
                            .professional_experience_form_start_date_label),
                  ),
                  const SpaceSmall.w(),
                  SizedBox(
                    width: 145,
                    child: DatePickerFormField(
                      validator: _isExperienceOngoing == false
                          ? _endDateValidator
                          : null,
                      controller: _controller.endDate,
                      enabled: _isExperienceOngoing == false,
                      label: context
                          .l10n.professional_experience_form_end_date_label,
                    ),
                  ),
                ],
              ),
              const SpaceSmall.w(),
              CheckboxField(
                controller: _controller.ongoing,
                onChanged: (checked) =>
                    setState(() => _isExperienceOngoing = checked),
                text: context.labelMedium(
                  context.l10n.professional_experience_form_ongoing_job,
                ),
              ),
            ],
          ),
          const SpaceSmall.h(),
          SizedBox(
            width: 600,
            child: TbtTextFormField(
              controller: _controller.description,
              textInputAction: TextInputAction.next,
              minLines: 3,
              maxLines: 3,
              decoration: InputDecoration(
                errorMaxLines: 3,
                labelText:
                    context.l10n.professional_experience_form_description_label,
                hintText:
                    context.l10n.professional_experience_form_description_hint,
              ),
            ),
          )
        ],
      ),
    );
  }
}
