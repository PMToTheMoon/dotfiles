import 'package:zanalys/authentication/authentication.dart';
import 'package:zanalys_api/zanalys_api.dart';

class DocumentService {
  DocumentService({
    required this.authService,
  }) {
    _client = ZanalysPrivateApiClient(
      baseUrl,
      authenticationProvider: authService,
    );
  }

  final AuthenticationService authService;

  late final ZanalysPrivateApiClient _client;
}
