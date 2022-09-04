import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zanalys/app/app_services.dart';
import 'package:zanalys/components/real_width_sizedbox.dart';
import 'package:zanalys/generated/locale_keys.g.dart';

class UploadDocumentPickerBottomSheet extends StatelessWidget {
  final ValueChanged onSelected;

  const UploadDocumentPickerBottomSheet({Key? key, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildElement(context, LocaleKeys.home_imagePicker_gallery.tr(),
            Icons.photo, ImageSource.gallery),
        _buildElement(context, LocaleKeys.home_imagePicker_camera.tr(),
            Icons.camera_alt_outlined, ImageSource.camera),
      ],
    );
  }

  GestureDetector _buildElement(
      BuildContext context, String text, IconData icon, ImageSource source) {
    return GestureDetector(
      onTap: () {
        onSelected.call(source);
        AppServices.navigation.back();
      },
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
