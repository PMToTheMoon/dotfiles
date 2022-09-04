handlePushNotification(BuildContext context, Map<String, dynamic> data) {
  String code;
  if (data.containsKey('code')) {
    code = data['code'];
    toDocumentUpload(args: UploadDocumentScreenArgs(accessCode: code));
  } else {
    toDocumentUpload();
  }
}
