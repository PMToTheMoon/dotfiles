import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zanalys/generated/locale_keys.g.dart';
import 'package:zanalys/resources/app_colors.dart';
import 'package:zanalys/resources/app_images.dart';

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
            AppImages.zanalysLogo,
            width: logoSize,
            height: logoSize,
          ),
          const SizedBox(height: 48),
          Text(
            LocaleKeys.global_appName.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.primary, fontSize: 32),
          )
        ],
      ),
    );
  }
}
