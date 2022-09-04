import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:neat/neat.dart';
part 'new_observation_form_controller.dart';
part 'new_observation_form_snapshot.dart';

class NewObservationForm extends StatefulWidget {
  const NewObservationForm({
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

  final NewObservationFormController? controller;

  @override
  NewObservationFormState createState() => NewObservationFormState();
}

class NewObservationFormState extends State<NewObservationForm> {
  NewObservationFormState();

  late final _controller = widget.controller ?? NewObservationFormController();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      onWillPop: widget.onWillPop,
      autovalidateMode: widget.autovalidateMode,
      key: _controller._formKey,
      child: Column(
        children: [
          ...[
            Padding(
                padding: const PaddingSmaller.horizontal(),
                child: TextFormField(
                    controller: _controller.title,
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.required(
                        errorText: context.l10n.required_error),
                    decoration: InputDecoration(
                        errorMaxLines: 3,
                        labelText: context.l10n.record_title)))
          ],
          const SpaceSmall.h(),
          Padding(
              padding: const PaddingSmaller.horizontal(),
              child: TitledSection(
                  title: context.l10n.hidden_observation_title,
                  required: false,
                  child: Column(children: [
                    MultiLineTextFormField(
                        controller: _controller.hiddenReason,
                        textInputAction: TextInputAction.next,
                        hint: context.l10n.hidden_observation_hint,
                        validator: (value) {
                          if (value?.isNotEmpty == true) return null;
                          if (_controller.patientReason.text.isNotEmpty ==
                              true) {
                            return null;
                          }
                          return context.l10n.hidden_observation_error;
                        })
                  ]))),
          const SpaceSmall.h(),
          Padding(
              padding: const PaddingSmaller.horizontal(),
              child: TitledSection(
                  title: context.l10n.patient_observation_title,
                  subtitle: context.l10n.patient_observation_subtitle,
                  required: false,
                  child: Column(children: [
                    MultiLineTextFormField(
                        controller: _controller.patientReason,
                        textInputAction: TextInputAction.next,
                        hint: context.l10n.patient_observation_hint,
                        validator: (value) {
                          if (value?.isNotEmpty == true) return null;
                          if (_controller.hiddenReason.text.isNotEmpty ==
                              true) {
                            return null;
                          }
                          return context.l10n.patient_observation_error;
                        })
                  ]))),
          const SpaceSmall.h(),
          ...[
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Padding(
                  padding: const PaddingSmaller.horizontal(),
                  child: context.headlineMedium(
                      context.l10n.obs_form_new_consultation_title)),
              const SpaceSmallest.h(),
              Padding(
                  padding: const PaddingSmaller.horizontal(),
                  child: context.bodyMedium(
                      context.l10n.obs_form_new_consultation_label)),
              ChipSelectorFormField(
                  chips: {
                    context.l10n.obs_consultation_in_person,
                    context.l10n.obs_consultation_distance,
                    context.l10n.obs_no_consultation
                  },
                  controller: _controller.consultation,
                  padding: const PaddingSmaller.horizontal(),
                  maxChipSelected: 1,
                  validator: FormBuilderValidators.required(
                      errorText: context.l10n.required_error))
            ])
          ]
        ],
      ),
    );
  }
}
