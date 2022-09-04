import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zanalys/app/app_services.dart';

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
        _buildElement(
          context,
          context.l10n.image_picker_gallery,
          Icons.photo,
          ImageSource.gallery,
        ),
        _buildElement(context, context.l10n.image_picker_camera,
            Icons.camera_alt_outlined, ImageSource.camera),
      ],
    );
  }

  GestureDetector _buildElement(
      BuildContext context, String text, IconData icon, ImageSource source) {
    return GestureDetector(
      onTap: () {
        onSelected.call(source);
        Navigator.of(context).pop();
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
