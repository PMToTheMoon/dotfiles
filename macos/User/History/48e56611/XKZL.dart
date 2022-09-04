import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
part 'cloture_complement_form_controller.dart';
part 'cloture_complement_form_snapshot.dart';

class ClotureComplementForm extends StatefulWidget {
  const ClotureComplementForm({
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

  final ClotureComplementFormController? controller;

  @override
  ClotureComplementFormState createState() => ClotureComplementFormState();
}

class ClotureComplementFormState extends State<ClotureComplementForm> {
  ClotureComplementFormState();

  late final _controller =
      widget.controller ?? ClotureComplementFormController();

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
                  title: context.l10n.patient_observation_title,
                  subtitle: context.l10n.patient_observation_subtitle,
                  required: false,
                  child: Column(children: [
                    MultiLineTextFormField(
                        controller: _controller.patientReason,
                        textInputAction: TextInputAction.next,
                        hint: context.l10n.patient_observation_hint,
                        border: false)
                  ])))
        ],
      ),
    );
  }
}
