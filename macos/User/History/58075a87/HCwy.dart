import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neat/neat.dart';

import 'package:common/common.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double logoSize = 180;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.images.zanalysLogo,
            width: logoSize,
            height: logoSize,
          ),
          const SizedBox(height: 48),
          Text(
            context.l10n.app_name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: context.colorScheme.primary,
              fontSize: 32,
            ),
          )
        ],
      ),
    );
  }
}
