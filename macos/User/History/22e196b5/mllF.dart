import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/components/full_screen_loader_layout.dart';
import 'package:zanalys/data/model/document_type.dart';
import 'package:zanalys/features/upload_document/bloc/upload_document_state.dart';
import 'package:zanalys/features/upload_document/ui/upload_document_body.dart';
import 'package:zanalys/generated/locale_keys.g.dart';
import 'package:zanalys/utils/bloc_utils.dart';

import 'bloc/upload_document_bloc.dart';

class UploadDocumentScreen extends StatefulWidget {
  final UploadDocumentScreenArgs? args;

  const UploadDocumentScreen({Key? key, this.args}) : super(key: key);

  @override
  State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocCreatorWithListener<UploadDocumentBloc, UploadDocumentState>(
      create: (context) => UploadDocumentBloc(
          pushNotificationAccessCode: widget.args?.accessCode,
          pushNotificationDocumentType: widget.args?.documentType),
      listener: (context, state) {
        setState(() {});
        if (state.status.isSubmissionInProgress) {
          _showLoading(true);
        }
        if (state.status.isSubmissionFailure) {
          _showLoading(false);
          _showError();
        }
        if (state.status.isSubmissionSuccess) {
          _showLoading(false);
          _showSuccess();
        }
      },
      child: Scaffold(
        body: FullScreenLoaderLayout(
          isLoading: _isLoading,
          child: const UploadDocumentBody(),
        ),
      ),
    );
  }

  _showLoading(bool show) {
    setState(() {
      _isLoading = show;
    });
  }

  _showSuccess() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(LocaleKeys.uploadDocument_success.tr()),
        ),
      );
  }

  _showError() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(LocaleKeys.global_errors_undefined.tr()),
        ),
      );
  }
}

class UploadDocumentScreenArgs {
  final String accessCode;
  final DocumentType? documentType;

  UploadDocumentScreenArgs({required this.accessCode, this.documentType});
}
