import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:neat/neat.dart';

import 'new_general_rapport_form_snapshot.dart';

export 'new_general_rapport_form_snapshot.dart';

part 'new_general_rapport_form_controller.dart';

class NewGeneralRapportForm extends StatefulWidget {
  const NewGeneralRapportForm({
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

  final NewGeneralRapportFormController? controller;

  @override
  NewGeneralRapportFormState createState() => NewGeneralRapportFormState();
}

class NewGeneralRapportFormState extends State<NewGeneralRapportForm> {
  NewGeneralRapportFormState();

  late final _controller =
      widget.controller ?? NewGeneralRapportFormController();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      onWillPop: widget.onWillPop,
      autovalidateMode: widget.autovalidateMode,
      key: _controller.formKey,
      child: Column(
        children: [
          Padding(
            padding: const PaddingSmaller.horizontal(),
            child: TextFormField(
              controller: _controller.title,
              textInputAction: TextInputAction.next,
              validator: FormBuilderValidators.required(
                  errorText: context.l10n.required_error),
              decoration: InputDecoration(
                errorMaxLines: 3,
                labelText: context.l10n.record_title,
              ),
            ),
          ),
          const SpaceSmall.h(),
          Padding(
            padding: const PaddingSmaller.horizontal(),
            child: TitledSection(
              title: context.l10n.hidden_observation_title,
              required: false,
              child: MultiLineTextFormField(
                controller: _controller.hiddenReason,
                hint: context.l10n.hidden_observation_hint,
                border: false,
                // validator: FormBuilderValidators.required(
                //   errorText: context.l10n.required_error,
                // ),
                validator: (value) {
                  if (value?.isNotEmpty == true) return null;
                  if (_controller.report.text.isNotEmpty == true) {
                    return null;
                  }
                  return context.l10n.hidden_observation_error;
                },
              ),
            ),
          ),
          const SpaceSmall.h(),
          Padding(
            padding: const PaddingSmaller.horizontal(),
            child: TitledSection(
              title: context.l10n.obs_report_title,
              subtitle: context.l10n.obs_report_subtitle,
              required: false,
              child: MultiLineTextFormField(
                controller: _controller.report,
                hint: context.l10n.obs_report_hint,
                border: false,
                validator: (value) {
                  if (value?.isNotEmpty == true) return null;
                  if (_controller.hiddenReason.text.isNotEmpty == true) {
                    return null;
                  }
                  return context.l10n.patient_observation_error;
                },
              ),
            ),
          ),
          const SpaceSmall.h(),
          Padding(
              padding: const PaddingSmaller.horizontal(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    context.headlineMedium(
                        context.l10n.obs_form_new_consultation_title),
                    const SpaceSmall.h(),
                    context.bodyMedium(
                        context.l10n.obs_form_new_consultation_label)
                  ])),
          const SpaceSmall.h(),
          ChipSelectorFormField(
              controller: _controller.consultation,
              chips: {
                context.l10n.obs_consultation_in_person,
                context.l10n.obs_consultation_distance,
                context.l10n.obs_no_consultation
              },
              padding: const PaddingSmaller.horizontal(),
              maxChipSelected: 1,
              validator: FormBuilderValidators.required(
                  errorText: context.l10n.required_error))
        ],
      ),
    );
  }
}
