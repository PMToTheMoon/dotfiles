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
    this.controller,
    super.key,
  }) : spacing = spacing ?? const SizedBox.shrink();

  final WillPopCallback? onWillPop;

  final VoidCallback? onChanged;

  final AutovalidateMode? autovalidateMode;

  final Widget spacing;

  final GeneralInitialObservationFormController? controller;

  @override
  GeneralInitialObservationFormState createState() =>
      GeneralInitialObservationFormState();
}

class GeneralInitialObservationFormState
    extends State<GeneralInitialObservationForm> {
  GeneralInitialObservationFormState();

  late final _controller =
      widget.controller ?? GeneralInitialObservationFormController();

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
                validator: (value) => "hey!",
              )
            ],
          ),
          widget.spacing,
          FormSection(
            title: context.l10n.hidden_reason_title,
            required: false,
            children: [
              MultiLineTextFormField(
                controller: _controller.hiddenReason,
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
                controller: _controller.patientReason,
                hint: context.l10n.patient_reason_hint,
              )
            ],
          ),
          widget.spacing,
          FormSection(
            title: context.l10n.clinical_exam_title,
            required: true,
            children: [
              Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller.weight,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: context.l10n.weight_hint,
                    ),
                  ),
                ),
                const SpaceSmaller.w(),
                Expanded(
                  child: TextFormField(
                    controller: _controller.height,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: context.l10n.height_hint,
                    ),
                  ),
                ),
              ]),
              const SpaceSmaller.h(),
              Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller.pas,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: context.l10n.pas_hint,
                    ),
                  ),
                ),
                const SpaceSmaller.w(),
                Expanded(
                  child: TextFormField(
                    controller: _controller.pad,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: context.l10n.pad_hint,
                    ),
                  ),
                ),
              ]),
              const SpaceSmaller.h(),
              Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller.temperature,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: context.l10n.temperature_hint,
                    ),
                  ),
                ),
                const SpaceSmaller.w(),
                Expanded(
                  child: TextFormField(
                    controller: _controller.heartRate,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: context.l10n.heart_rate_hint,
                    ),
                  ),
                ),
              ])
            ],
          ),
          widget.spacing,
          FormSection(
            title: context.l10n.medical_history_title,
            required: false,
            children: [
              ChipEditorFormField(
                controller: _controller.medicalHistory,
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
                controller: _controller.additionalExaminations,
                hint: context.l10n.additional_examinations_hint,
              )
            ],
          )
        ],
      ),
    );
  }
}
