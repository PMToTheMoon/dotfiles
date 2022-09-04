import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';
import 'education_form_controller.dart';

export 'education_form_controller.dart';
export 'education_form_snapshot.dart';

class EducationForm extends StatefulWidget {
  const EducationForm({
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

  final EducationFormController? controller;

  @override
  EducationFormState createState() => EducationFormState();
}

class EducationFormState extends State<EducationForm> {
  EducationFormState();

  late EducationFormController _effectiveController =
      widget.controller ?? EducationFormController();

  bool _isEducationOngoing = false;

  @override
  void didUpdateWidget(old) {
    super.didUpdateWidget(old);
    _effectiveController = widget.controller ?? EducationFormController();
    _isEducationOngoing = _effectiveController.ongoing.value;
  }

  Validator<DateTime> get _startDateValidator {
    return Validators.compose([
      (_) {
        if (_effectiveController.startDate.text.isEmpty) {
          return context.l10n.form_error_empty_field;
        }
        return null;
      },
      Validators.datePickerTextFormat(
        context,
        _effectiveController.startDate,
      ),
    ]);
  }

  Validator<DateTime> get _endDateValidator {
    return Validators.dynamic(() {
      if (_effectiveController.ongoing.value == true) return Validators.none;
      return Validators.compose([
        (_) {
          if (_effectiveController.endDate.text.isEmpty) {
            return context.l10n.form_error_empty_field;
          }
          return null;
        },
        Validators.datePickerTextFormat(
          context,
          _effectiveController.endDate,
        ),
        Validators.required(context),
        (value) {
          final endDate = _effectiveController.endDate.date;
          final startDate = _effectiveController.startDate.date;
          if (endDate != null && startDate != null) {
            if (endDate.isAfter(startDate) == false) {
              return context.l10n.form_error_date_is_not_after(startDate);
            }
          }
          return null;
        },
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      onWillPop: widget.onWillPop,
      autovalidateMode: widget.autovalidateMode,
      key: _effectiveController.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 500,
            child: Column(
              children: [
                TbtTextFormField(
                  controller: _effectiveController.title,
                  textInputAction: TextInputAction.next,
                  validator: Validators.required(context),
                  decoration: InputDecoration(
                    errorMaxLines: 3,
                    labelText: context.l10n.education_form_title_label,
                    hintText: context.l10n.education_form_title_hint,
                  ),
                ),
                const SpaceSmall.h(),
                TbtTextFormField(
                    controller: _effectiveController.school,
                    textInputAction: TextInputAction.next,
                    validator: Validators.required(context),
                    decoration: InputDecoration(
                        errorMaxLines: 3,
                        labelText: context.l10n.education_form_school_label,
                        hintText: context.l10n.education_form_school_hint)),
                const SpaceSmall.h(),
                TbtTextFormField(
                  controller: _effectiveController.location,
                  textInputAction: TextInputAction.next,
                  validator: Validators.required(context),
                  decoration: InputDecoration(
                    errorMaxLines: 3,
                    labelText: context.l10n.education_form_location_label,
                    hintText: context.l10n.education_form_location_hint,
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
                  //Start date
                  SizedBox(
                    width: 145,
                    child: DatePickerFormField(
                      controller: _effectiveController.startDate,
                      validator: _startDateValidator,
                      label: context.l10n.education_form_start_date_label,
                    ),
                  ),
                  const SpaceSmall.w(),
                  //End date
                  SizedBox(
                    width: 145,
                    child: DatePickerFormField(
                      validator: _endDateValidator,
                      controller: _effectiveController.endDate,
                      enabled: _isEducationOngoing == false,
                      label: context.l10n.education_form_end_date_label,
                    ),
                  ),
                ],
              ),
              const SpaceSmall.w(),
              CheckboxField(
                controller: _effectiveController.ongoing,
                onChanged: (checked) =>
                    setState(() => _isEducationOngoing = checked),
                text: context.labelMedium(
                  context.l10n.education_form_ongoing_job,
                ),
              ),
            ],
          ),
          const SpaceSmall.h(),
          // DESCRIPTION
          SizedBox(
            width: 600,
            child: TbtTextFormField(
              controller: _effectiveController.description,
              minLines: 3,
              maxLines: 10,
              decoration: InputDecoration(
                errorMaxLines: 3,
                labelText: context.l10n.education_form_description_label,
                hintText: context.l10n.education_form_description_hint,
              ),
            ),
          )
        ],
      ),
    );
  }
}
