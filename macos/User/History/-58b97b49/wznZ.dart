import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:zanalys/app/app_services.dart';
import 'package:zanalys/components/real_height_sizedbox.dart';
import 'package:zanalys/components/real_width_sizedbox.dart';
import 'package:zanalys/features/home/ui/components/home_take_photo.dart';
import 'package:zanalys/generated/locale_keys.g.dart';
import 'package:zanalys/resources/app_colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RealHeightSizedBox(height: 80),
          Row(
            children: [
              Text(
                LocaleKeys.home_title.tr(),
                style: TextStyle(
                    fontSize: 26.sp(context),
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack),
              ),
              const RealWidthSizedBox(width: 5),
              Text(
                '👋',
                style: TextStyle(fontSize: 26.sp(context)),
              )
            ],
          ),
          const RealHeightSizedBox(height: 40),
          HomeTakePhoto(
            onTap: () => AppServices.navigation.toDocumentUpload(),
          ),
        ],
      ),
    );
  }
}
