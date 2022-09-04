import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zanalys/generated/locale_keys.g.dart';
import 'package:zanalys/resources/app_colors.dart';
import 'package:zanalys/resources/app_images.dart';
import 'package:zanalys/utils/size_utils.dart';

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
          AppImages.zanalysLogo,
          width: logoSize,
          height: logoSize,
        ),
        const SizedBox(width: 12),
        Text(
          LocaleKeys.global_appName.tr(),
          style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
