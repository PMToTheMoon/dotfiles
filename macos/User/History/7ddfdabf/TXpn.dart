import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/app/services.dart';
import 'package:zanalys/upload_document/models/document_type.dart';
import 'package:zanalys/upload_document/bloc/upload_document_event.dart';
import 'package:zanalys/upload_document/bloc/upload_document_state.dart';
import 'package:zanalys/upload_document/validators/access_code.dart';
import 'package:zanalys/upload_document/validators/document.dart';
import 'package:zanalys/upload_document/validators/document_type_validator.dart';

class UploadDocumentBloc
    extends Bloc<UploadDocumentEvent, UploadDocumentState> {
  final String? pushNotificationAccessCode;
  final DocumentType? pushNotificationDocumentType;

  UploadDocumentBloc(
      {this.pushNotificationAccessCode, this.pushNotificationDocumentType})
      : super(UploadDocumentState(
            accessCode: AccessCode.dirty(pushNotificationAccessCode ?? ''),
            documentType: DocumentTypeValidator.dirty(
                pushNotificationDocumentType ?? DocumentType.unknown))) {
    on<DocumentSelected>(_onDocumentSelected);
    on<DocumentAccessCodedUpdated>(_onDocumentAccessCodeUpdated);
  }

  void _onDocumentAccessCodeUpdated(DocumentAccessCodedUpdated event,
      Emitter<UploadDocumentState> emit) async {
    final code = AccessCode.dirty(event.code);
    emit(state.copyWith(
      accessCode: code.valid ? code : AccessCode.pure(event.code),
      status: Formz.validate([code]),
    ));
  }

  void _onDocumentSelected(
      DocumentSelected event, Emitter<UploadDocumentState> emit) async {
    final document = Document.dirty(event.path);
    emit(state.copyWith(
      document: document.valid ? document : Document.pure(event.path),
      status: Formz.validate([document]),
    ));

    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await AppServices.document.uploadDocument(
          path: document.value,
          accessCode: state.accessCode.value,
          type: state.documentType.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (e) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void documentSelected(String path) {
    add(DocumentSelected(path: path));
  }

  void accessCodeUpdated(String code) {
    add(DocumentAccessCodedUpdated(code: code));
  }

  bool isUploadButtonEnabled() {
    return state.accessCode.valid;
  }
}
