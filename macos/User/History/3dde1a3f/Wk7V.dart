import 'package:zanalys_api/src/models/document_domain.dart';

class DocumentDomainMapper {
  String convert(DocumentDomain domain) {
    switch (domain) {
      case DocumentDomain.folder:
        return 'DOSSIER';
      case DocumentDomain.report:
        return 'RAPPORT';
      default:
        throw Exception('Unknown Document domain');
    }
  }
}
