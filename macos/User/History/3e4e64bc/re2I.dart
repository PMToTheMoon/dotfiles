import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../cloture_complement_card/new_complement_form.dart';

class CloseComplementFormCard extends StatefulWidget {
  const CloseComplementFormCard({
    super.key,
    this.onFormSubmitted,
  });

  final ValueChanged<CloseComplementFormSnapshot>? onFormSubmitted;

  @override
  State<CloseComplementFormCard> createState() =>
      _CloseComplementFormCardState();
}

class _CloseComplementFormCardState extends State<CloseComplementFormCard> {
  final controller = CloseComplementFormController();

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
          CloseComplementForm(
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
