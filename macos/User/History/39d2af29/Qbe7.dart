import 'package:zanalys/authentication/otp/otp_screen.dart';
import 'package:zanalys/upload_document/view/upload_document_page.dart';

abstract class NavigationService {
  to(String routeName, {dynamic arguments, bool clearStack});

  handlePushNotification(Map<String, dynamic> data);

  back();

  toSignIn({bool forced});

  toHome();

  toOTP(OTPScreenArgs args);

  toDocumentUpload({UploadDocumentScreenArgs? args});
}
