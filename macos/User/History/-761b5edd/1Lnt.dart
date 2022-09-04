import 'package:common/common.dart';

import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

extension DisplayRequest on RequestType {
  String display(BuildContext context) {
    switch (this) {
      case RequestType.teleExpertise:
        return context.l10n.request_tele_expertise;
      case RequestType.consultation:
        return context.l10n.request_consultation;
    }
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({
    required this.from,
    required this.type,
    super.key,
  });

  final String from;
  final RequestType type;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      backgroundColor: context.colorScheme.background,
      borderColor: context.colorScheme.primary,
      padding: const PaddingSmaller(),
      borderRadius: Dimensions.borderRadiusSmaller,
      child: Row(
        children: [
          Icon(
            Icons.spatial_audio_off,
            size: Dimensions.iconSmall,
            color: context.colorScheme.primary,
          ),
          const SpaceSmallest.w(),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: context.l10n.request_card_request_type(
                    type.display(context),
                  ),
                  style: context.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: context.l10n.request_card_sender(from),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
