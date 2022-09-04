import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/data/model/document_type.dart';
import 'package:zanalys/upload_document/bloc/upload_document_state.dart';
import 'package:zanalys/upload_document/ui/upload_document_body.dart';
import 'package:zanalys/utils/bloc_utils.dart';

import '../bloc/upload_document_bloc.dart';

class UploadDocumentScreen extends StatefulWidget {
  static Future<void> open(
    BuildContext context,
    UploadDocumentScreenArgs args,
  ) async =>
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UploadDocumentScreen(args: args),
        ),
      );

  const UploadDocumentScreen({Key? key, this.args}) : super(key: key);

  final UploadDocumentScreenArgs? args;

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
        body: FullScreenLoader(
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
          content: Text(context.l10n.upload_document_success),
        ),
      );
  }

  _showError() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(context.l10n.error_undefined),
        ),
      );
  }
}

class UploadDocumentScreenArgs {
  final String accessCode;
  final DocumentType? documentType;

  UploadDocumentScreenArgs({required this.accessCode, this.documentType});
}
