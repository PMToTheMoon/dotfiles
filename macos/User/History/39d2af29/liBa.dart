import 'package:zanalys/authentication/otp/otp_screen.dart';
import 'package:zanalys/upload_document/upload_document_screen.dart';

abstract class NavigationService {
  to(String routeName, {dynamic arguments, bool clearStack});

  handlePushNotification(Map<String, dynamic> data);

  back();

  toSignIn({bool forced});

  toHome();

  toOTP(OTPScreenArgs args);

  toDocumentUpload({UploadDocumentScreenArgs? args});
}
