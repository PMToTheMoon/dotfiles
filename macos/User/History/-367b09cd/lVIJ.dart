import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'new_complement_form.dart';

class NewComplementFormCard extends StatefulWidget {
  const NewComplementFormCard({
    super.key,
    this.onFormSubmitted,
  });

  final ValueChanged<NewComplementFormSnapshot>? onFormSubmitted;

  @override
  State<NewComplementFormCard> createState() => _NewComplementFormCardState();
}

class _NewComplementFormCardState extends State<NewComplementFormCard> {
  final controller = NewComplementFormController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Scrollable.ensureVisible(
        context,
        alignment: -1,
        curve: Feel.curveMedium,
        duration: Feel.durationMedium,
      );
    });
  }

  void _onSharePressed() {
    if (controller.validate()) {
      widget.onFormSubmitted?.call(controller.snapshot());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      padding: const PaddingSmaller.vertical(),
      borderRadius: Dimensions.borderRadiusSmaller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NewComplementForm(
            controller: controller,
          ),
          const SpaceMedium.h(),
          Padding(
            padding: const PaddingSmaller.horizontal(),
            child: ElevatedButton(
              onPressed: _onSharePressed,
              child: Text(context.l10n.obs_share_button),
            ),
          ),
        ],
      ),
    );
  }
}