import 'package:flutter/material.dart';
import 'package:zanalys/upload_document/upload_document.dart';

Future<void> handlePushNotification(
    BuildContext context, Map<String, dynamic> data) async {
  String code;
  if (data.containsKey('code')) {
    code = data['code'];
    await UploadDocumentPage.open(
      context,
      UploadDocumentScreenArgs(accessCode: code),
    );
  } else {
    UploadDocumentPage.open(context);
  }
}
