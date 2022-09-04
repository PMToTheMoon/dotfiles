import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
part 'general_initial_observation_form_controller.dart';
part 'general_initial_observation_form_snapshot.dart';

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
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.required(
                        errorText: context.l10n.required_error),
                    decoration: InputDecoration(
                        errorMaxLines: 3,
                        labelText: context.l10n.record_title_hint))
              ]),
          FormSection(
              title: context.l10n.hidden_reason_title,
              subtitle: context.l10n.hidden_reason_subtitle,
              required: false,
              children: [
                MultiLineTextFormField(
                    controller: _controller.hiddenReason,
                    textInputAction: TextInputAction.next,
                    hint: context.l10n.hidden_reason_hint,
                    validator: (value) {
                      if (value?.isNotEmpty == true) return null;
                      if (_controller.patientReason.text.isNotEmpty == true) {
                        return null;
                      }
                      return context.l10n.hidden_reason_error;
                    })
              ]),
          FormSection(
              title: context.l10n.patient_reason_title,
              subtitle: context.l10n.patient_reason_subtitle,
              required: false,
              children: [
                MultiLineTextFormField(
                    controller: _controller.patientReason,
                    textInputAction: TextInputAction.next,
                    hint: context.l10n.patient_reason_hint,
                    validator: (value) {
                      if (value?.isNotEmpty == true) return null;
                      if (_controller.hiddenReason.text.isNotEmpty == true) {
                        return null;
                      }
                      return context.l10n.patient_reason_error;
                    })
              ]),
          FormSection(
              title: context.l10n.clinical_exam_title,
              required: true,
              children: [
                Row(children: [
                  Expanded(
                      child: TextFormField(
                          controller: _controller.weight,
                          textInputAction: TextInputAction.next,
                          validator: FormBuilderValidators.required(
                              errorText: context.l10n.required_error),
                          decoration: InputDecoration(
                              errorMaxLines: 3,
                              labelText: context.l10n.weight_hint),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ])),
                  const SpaceSmaller.w(),
                  Expanded(
                      child: TextFormField(
                          controller: _controller.height,
                          textInputAction: TextInputAction.next,
                          validator: FormBuilderValidators.required(
                              errorText: context.l10n.required_error),
                          decoration: InputDecoration(
                              errorMaxLines: 3,
                              labelText: context.l10n.height_hint),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ]))
                ]),
                const SpaceSmall.h(),
                Row(children: [
                  Expanded(
                      child: TextFormField(
                          controller: _controller.pas,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              errorMaxLines: 3,
                              labelText: context.l10n.pas_hint),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ])),
                  const SpaceSmaller.w(),
                  Expanded(
                      child: TextFormField(
                          controller: _controller.pad,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              errorMaxLines: 3,
                              labelText: context.l10n.pad_hint),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ]))
                ]),
                const SpaceSmall.h(),
                Row(children: [
                  Expanded(
                      child: TextFormField(
                          controller: _controller.temperature,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              errorMaxLines: 3,
                              labelText: context.l10n.temperature_hint),
                          keyboardType: TextInputType.number,
                          inputFormatters: FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9|.]')))),
                  const SpaceSmaller.w(),
                  Expanded(
                      child: TextFormField(
                          controller: _controller.heartRate,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              errorMaxLines: 3,
                              labelText: context.l10n.heart_rate_hint),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ]))
                ])
              ]),
          FormSection(
              title: context.l10n.medical_history_title,
              required: false,
              children: [
                ChipEditorFormField(
                    controller: _controller.medicalHistory,
                    label: context.l10n.medical_history_hint)
              ]),
          FormSection(
              title: context.l10n.symptoms_title,
              required: false,
              children: [
                ChipEditorFormField(
                    controller: _controller.symptoms,
                    label: context.l10n.symptoms_hint)
              ]),
          FormSection(
              title: context.l10n.treatment_title,
              required: false,
              children: [
                ChipEditorFormField(
                    controller: _controller.treatment,
                    label: context.l10n.treatment_hint)
              ]),
          FormSection(
              title: context.l10n.additional_examinations_title,
              required: false,
              children: [
                MultiLineTextFormField(
                    controller: _controller.additionalExaminations,
                    textInputAction: TextInputAction.next,
                    hint: context.l10n.additional_examinations_hint)
              ])
        ],
      ),
    );
  }
}
