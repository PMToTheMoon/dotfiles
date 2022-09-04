import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:zanalys/components/real_height_sizedbox.dart';
import 'package:zanalys/generated/locale_keys.g.dart';
import 'package:zanalys/resources/app_colors.dart';

class HomeTakePhoto extends StatelessWidget {
  final VoidCallback onTap;

  const HomeTakePhoto({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: AppColors.homeTakePhotoBackground,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.photo_camera),
              const RealHeightSizedBox(height: 3),
              Text(
                LocaleKeys.home_buttonTakePhoto.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.sp(context), fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
