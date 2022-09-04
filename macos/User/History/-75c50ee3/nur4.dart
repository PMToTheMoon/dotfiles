import 'package:flutter/material.dart';
import 'package:zanalys/upload_document/upload_document.dart';

Future<void> handlePushNotification(
    NavigatorState navigator, Map<String, dynamic> data) async {
  final code = data['code'];
  await navigator.push(
    MaterialPageRoute(
      builder: (context) => UploadDocumentPage(
        args: code != null ? UploadDocumentScreenArgs(accessCode: code) : null,
      ),
    ),
  );
}
