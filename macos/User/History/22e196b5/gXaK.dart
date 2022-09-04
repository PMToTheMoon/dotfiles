import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/upload_document/models/document_type.dart';
import 'package:zanalys/upload_document/bloc/upload_document_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zanalys/upload_document/upload_document.dart';

import 'upload_document_body.dart';

class UploadDocumentPage extends StatefulWidget {
  static Future<void> open(
    BuildContext context, [
    UploadDocumentScreenArgs? args,
  ]) async =>
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UploadDocumentPage(args: args),
        ),
      );

  const UploadDocumentPage({Key? key, this.args}) : super(key: key);

  final UploadDocumentScreenArgs? args;

  @override
  State<UploadDocumentPage> createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {
  bool _isLoading = false;

  void _onStateChanged(BuildContext ctx, UploadDocumentState state) {
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadDocumentBloc(
        pushNotificationAccessCode: widget.args?.accessCode,
        pushNotificationDocumentType: widget.args?.documentType,
      ),
      child: BlocConsumer<UploadDocumentBloc, UploadDocumentState>(
        listener: _onStateChanged,
        builder: (c, s) => Scaffold(
          body: FullScreenLoader(
            isLoading: _isLoading,
            child: const UploadDocumentBody(),
          ),
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
