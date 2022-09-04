import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'general_initial_observation_form_snapshot.dart';

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
      key: _controller.formKey,
      child: Column(
        children: [
          TitledSection(
              title: context.l10n.record_title,
              required: true,
              child: TextFormField(
                  controller: _controller.title,
                  textInputAction: TextInputAction.next,
                  validator: FormBuilderValidators.required(
                      errorText: context.l10n.required_error),
                  decoration: InputDecoration(
                      errorMaxLines: 3,
                      labelText: context.l10n.record_title_hint))),
          TitledSection(
              title: context.l10n.hidden_observation_title,
              subtitle: context.l10n.hidden_observation_subtitle,
              required: false,
              child: MultiLineTextFormField(
                  hint: context.l10n.hidden_observation_hint,
                  validator: (value) {
                    if (value?.isNotEmpty == true) return null;
                    if (_controller.patientReason.text.isNotEmpty == true) {
                      return null;
                    }
                    return context.l10n.hidden_observation_error;
                  })),
          TitledSection(
              title: context.l10n.patient_observation_title,
              subtitle: context.l10n.patient_observation_subtitle,
              required: false,
              child: MultiLineTextFormField(
                  hint: context.l10n.patient_observation_hint,
                  validator: (value) {
                    if (value?.isNotEmpty == true) return null;
                    if (_controller.hiddenReason.text.isNotEmpty == true) {
                      return null;
                    }
                    return context.l10n.patient_observation_error;
                  })),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: TextFormField(
                    controller: _controller.weight,
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.required(
                        errorText: context.l10n.required_error),
                    decoration: InputDecoration(
                        errorMaxLines: 3,
                        labelText: context.l10n.weight_hint))),
            const SpaceSmaller.w(),
            Expanded(
                child: TextFormField(
                    controller: _controller.height,
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.required(
                        errorText: context.l10n.required_error),
                    decoration: InputDecoration(
                        errorMaxLines: 3, labelText: context.l10n.height_hint)))
          ]),
          const SpaceSmaller.h(),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: TextFormField(
                    controller: _controller.pas,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        errorMaxLines: 3, labelText: context.l10n.pas_hint))),
            const SpaceSmaller.w(),
            Expanded(
                child: TextFormField(
                    controller: _controller.pad,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        errorMaxLines: 3, labelText: context.l10n.pad_hint)))
          ]),
          const SpaceSmaller.h(),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: TextFormField(
                    controller: _controller.temperature,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        errorMaxLines: 3,
                        labelText: context.l10n.temperature_hint))),
            const SpaceSmaller.w(),
            Expanded(
                child: TextFormField(
                    controller: _controller.heartRate,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        errorMaxLines: 3,
                        labelText: context.l10n.heart_rate_hint)))
          ]),
          TitledSection(
              title: context.l10n.medical_history_title,
              required: false,
              child: ChipEditorFormField(
                  label: context.l10n.medical_history_hint)),
          TitledSection(
              title: context.l10n.symptoms_title,
              required: false,
              child: ChipEditorFormField(label: context.l10n.symptoms_hint)),
          TitledSection(
              title: context.l10n.treatment_title,
              required: false,
              child: ChipEditorFormField(label: context.l10n.treatment_hint)),
          TitledSection(
              title: context.l10n.additional_observation_title,
              required: false,
              child: MultiLineTextFormField(
                  hint: context.l10n.additional_observation_hint))
        ],
      ),
    );
  }
}
