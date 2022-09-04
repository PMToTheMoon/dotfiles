import 'package:flutter/material.dart';

handlePushNotification(BuildContext context, Map<String, dynamic> data) {
  String code;
  if (data.containsKey('code')) {
    code = data['code'];
    // Navigator.of(context).t
    // toDocumentUpload(args: UploadDocumentScreenArgs(accessCode: code));
  } else {
    // toDocumentUpload();
  }
}
