import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zanalys/components/basic_textfield.dart';
import 'package:zanalys/components/color_button.dart';
import 'package:zanalys/features/upload_document/bloc/upload_document_bloc.dart';
import 'package:zanalys/features/upload_document/ui/upload_document_picker_bottomsheet.dart';
import 'package:zanalys/generated/locale_keys.g.dart';

class UploadDocumentBody extends StatefulWidget {
  const UploadDocumentBody({Key? key}) : super(key: key);

  @override
  State<UploadDocumentBody> createState() => _UploadDocumentBodyState();
}

class _UploadDocumentBodyState extends State<UploadDocumentBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Text(
            context.l10n.upload_document_title,
            // style: TextStyle(
            //     fontSize: 26,
            //     fontWeight: FontWeight.w600,
            //     color: AppColors.textBlack),
          ),
          const SizedBox(height: 40),
          BasicTextField(
              initialValue:
                  context.read<UploadDocumentBloc>().state.accessCode.value,
              labelText: LocaleKeys.uploadDocument_hintAccessCode.tr(),
              onChanged: (code) {
                context.read<UploadDocumentBloc>().accessCodeUpdated(code);
              }),
          const SizedBox(height: 34),
          Center(
            child: ColorButton(
              label: LocaleKeys.uploadDocument_button.tr(),
              onPressed:
                  context.read<UploadDocumentBloc>().isUploadButtonEnabled()
                      ? (() => _showSourceSelectionSheet(context))
                      : null,
            ),
          )
        ],
      ),
    );
  }

  _showSourceSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return UploadDocumentPickerBottomSheet(
          onSelected: (source) => _pickImage(context, source),
        );
      },
    );
  }

  _pickImage(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      context.read<UploadDocumentBloc>().documentSelected(pickedFile.path);
    }
  }

  _inputFolderId(BuildContext context) {}
}
