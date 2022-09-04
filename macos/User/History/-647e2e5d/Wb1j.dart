import 'package:formz/formz.dart';
import 'package:zanalys/upload_document/models/document_type.dart';

enum DocumentTypeValidationError { invalid }

class DocumentTypeValidator
    extends FormzInput<DocumentType, DocumentTypeValidationError> {
  const DocumentTypeValidator.pure([DocumentType value = DocumentType.unknown])
      : super.pure(value);

  const DocumentTypeValidator.dirty([DocumentType value = DocumentType.unknown])
      : super.dirty(value);

  @override
  DocumentTypeValidationError? validator(DocumentType? value) {
    return value != null ? null : DocumentTypeValidationError.invalid;
  }
}
