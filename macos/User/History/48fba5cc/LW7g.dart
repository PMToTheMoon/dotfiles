import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/upload_document/validators/access_code.dart';
import 'package:zanalys/upload_document/validators/document.dart';
import 'package:zanalys/upload_document/validators/document_type_validator.dart';

class UploadDocumentState extends Equatable {
  const UploadDocumentState({
    this.document = const Document.pure(),
    this.accessCode = const AccessCode.pure(),
    this.documentType = const DocumentTypeValidator.pure(),
    this.status = FormzStatus.pure,
  });

  final Document document;
  final AccessCode accessCode;
  final DocumentTypeValidator documentType;
  final FormzStatus status;

  UploadDocumentState copyWith({
    Document? document,
    AccessCode? accessCode,
    DocumentTypeValidator? documentType,
    FormzStatus? status,
  }) {
    return UploadDocumentState(
      document: document ?? this.document,
      accessCode: accessCode ?? this.accessCode,
      documentType: documentType ?? this.documentType,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [document, accessCode, documentType, status];
}
