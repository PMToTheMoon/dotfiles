import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/generated/locale_keys.g.dart';

import 'package:common/common.dart';

class AuthenticationHeader extends StatelessWidget {
  const AuthenticationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double logoSize = 54;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.images.zanalysLogo,
          width: logoSize,
          height: logoSize,
        ),
        const SizedBox(width: 12),
        context.headlineLarge(
          context.l10n.app_name,
          style: TextStyle(
            color: context.colorScheme.primary,
          ),
        )
      ],
    );
  }
}
