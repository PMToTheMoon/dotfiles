import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:tech_by_tech/auth/widgets/auth_app_bar.dart';
import 'package:translations/translations.dart';

class AuthPageShell extends StatelessWidget {
  const AuthPageShell({
    required this.body,
    super.key,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Scaffold(
            appBar: const AuthAppBar(),
            backgroundColor: context.colorScheme.surface,
            body: SingleChildScrollView(
              child: Padding(
                padding: const PaddingLargest(),
                child: body,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            color: context.tbtColors.brand,
            padding: const EdgeInsets.all(130),
            child: Align(
              alignment: const Alignment(0, -0.25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Column(
                      children: [
                        context.displayLarge(
                          context.l10n.auth_brand_display_title_1,
                          style:
                              TextStyle(color: context.colorScheme.onTertiary),
                          textAlign: TextAlign.center,
                        ),
                        const SpaceSmall.h(),
                        context.displayLarge(
                          context.l10n.auth_brand_display_title_2,
                          style:
                              TextStyle(color: context.colorScheme.onTertiary),
                          textAlign: TextAlign.center,
                        ),
                        const SpaceSmall.h(),
                        context.displayLarge(
                          context.l10n.auth_brand_display_title_3,
                          style:
                              TextStyle(color: context.colorScheme.onTertiary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SpaceLarge.h(),
                  context.bodyLarge(
                    context.l10n.auth_brand_display_text,
                    style: TextStyle(
                      color: context.colorScheme.onTertiary,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
