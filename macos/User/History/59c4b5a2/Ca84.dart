import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'new_general_rapport_form.dart';
export 'new_general_rapport_form.dart';

class NewGeneralRapportCard extends StatefulWidget {
  const NewGeneralRapportCard({
    super.key,
    this.request,
    this.onFormSubmitted,
  });

  final Widget? request;
  final ValueChanged<NewGeneralRapportFormSnapshot>? onFormSubmitted;

  @override
  State<NewGeneralRapportCard> createState() => _NewGeneralRapportCardState();
}

class _NewGeneralRapportCardState extends State<NewGeneralRapportCard> {
  final controller = NewGeneralRapportFormController();

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Scrollable.ensureVisible(
  //       context,
  //       alignment: .125,
  //       curve: Feel.curveMedium,
  //       duration: Feel.durationMedium,
  //     );
  //   });
  // }

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
          if (widget.request != null)
            Padding(
              padding: const EdgeInsets.only(
                left: Dimensions.paddingSmaller,
                right: Dimensions.paddingSmaller,
                bottom: Dimensions.paddingMedium,
              ),
              child: widget.request,
            ),
          NewGeneralRapportForm(
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
