import 'package:zanalys/authentication/authentication.dart';
import 'package:zanalys_api/zanalys_api.dart';

class DocumentService {
  DocumentService({required this.authService});

  final AuthenticationService authService;

  late final ZanalysPrivateApiClient _client;
}
