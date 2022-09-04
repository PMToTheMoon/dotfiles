import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:flutter/services.dart';
part 'general_initial_observation_form_snapshot.dart';
part 'general_initial_observation_form_controller.dart';

class GeneralInitialObservationForm extends StatefulWidget {
  const GeneralInitialObservationForm({
    this.onWillPop,
    this.onChanged,
    this.autovalidateMode,
    Widget? spacing,
    super.key,
  }) : spacing = spacing ?? const SizedBox(height: 12);

  final WillPopCallback? onWillPop;

  final VoidCallback? onChanged;

  final AutovalidateMode? autovalidateMode;

  final Widget spacing;

  @override
  GeneralInitialObservationFormState createState() =>
      GeneralInitialObservationFormState();
}

class GeneralInitialObservationFormState
    extends State<GeneralInitialObservationForm> {
  GeneralInitialObservationFormState();

  final _controller = GeneralInitialObservationFormController();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      onWillPop: widget.onWillPop,
      autovalidateMode: widget.autovalidateMode,
      key: _controller._formKey,
      child: Column(
        children: [
          FormSection(
            title: context.l10n.record_title,
            required: true,
            children: [
              TextFormField(
                controller: _controller.title,
                decoration:
                    InputDecoration(labelText: context.l10n.record_title_hint),
              )
            ],
          ),
          widget.spacing,
          FormSection(
            title: context.l10n.hidden_reason_title,
            required: false,
            children: [
              MultiLineTextFormField(
                controller: _controller.hidden_reason,
                hint: context.l10n.hidden_reason_hint,
              )
            ],
          ),
          widget.spacing,
          FormSection(
            title: context.l10n.patient_reason_title,
            required: false,
            children: [
              MultiLineTextFormField(
                controller: _controller.patient_reason,
                hint: context.l10n.patient_reason_hint,
              )
            ],
          ),
          widget.spacing,
          FormSection(
            title: context.l10n.clinical_exam_title,
            required: true,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                 inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
], /
              )
            ],
          ),
          widget.spacing,
          FormSection(
            title: context.l10n.medical_history_title,
            required: false,
            children: [
              ChipEditorFormField(
                controller: _controller.medical_history,
                label: context.l10n.medical_history_hint,
              )
            ],
          ),
          widget.spacing,
          FormSection(
            title: context.l10n.symptoms_title,
            required: false,
            children: [
              ChipEditorFormField(
                controller: _controller.symptoms,
                label: context.l10n.symptoms_hint,
              )
            ],
          ),
          widget.spacing,
          FormSection(
            title: context.l10n.treatment_title,
            required: false,
            children: [
              ChipEditorFormField(
                controller: _controller.treatment,
                label: context.l10n.treatment_hint,
              )
            ],
          ),
          widget.spacing,
          FormSection(
            title: context.l10n.additional_examinations_title,
            required: false,
            children: [
              MultiLineTextFormField(
                controller: _controller.additional_examinations,
                hint: context.l10n.additional_examinations_hint,
              )
            ],
          )
        ],
      ),
    );
  }
}
