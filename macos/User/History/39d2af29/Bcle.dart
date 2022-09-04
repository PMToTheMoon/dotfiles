import 'package:zanalys/authentication/otp/view/otp_page.dart';
import 'package:zanalys/upload_document/view/upload_document_page.dart';

abstract class NavigationService {
  to(String routeName, {dynamic arguments, bool clearStack});

  handlePushNotification(Map<String, dynamic> data);

  back();

  toSignIn({bool forced});

  toHome();

  toOTP(OTPPageArgs args);

  toDocumentUpload({UploadDocumentScreenArgs? args});
}
