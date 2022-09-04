import 'package:common/common.dart';

import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

enum RequestType {
  teleExpertise,
  consultation,
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
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "Demande de téléexpertise du ",
                style: context.textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: from,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
