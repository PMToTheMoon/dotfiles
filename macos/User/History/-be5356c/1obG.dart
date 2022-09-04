import '../models/document_domain.dart';

@Deprecated('Legacy code. Use new api structure instead')
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
