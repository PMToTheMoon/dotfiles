import 'package:flutter/material.dart';
import 'package:zanalys/upload_document/upload_document.dart';

handlePushNotification(BuildContext context, Map<String, dynamic> data) {
  String code;
  if (data.containsKey('code')) {
    code = data['code'];
    UploadDocumentPage.open(
      context,
      UploadDocumentScreenArgs(accessCode: code),
    );
  } else {
    // toDocumentUpload();
  }
}
