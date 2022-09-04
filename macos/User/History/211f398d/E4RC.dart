import 'package:app_client/payment_methods/new_payment_method/bloc/new_payment_method_bloc.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NewPaymentMethodResult { success, failure, canceled }

class NewPaymentMethodPage extends StatelessWidget {
  const NewPaymentMethodPage({
    Key? key,
  }) : super(key: key);

  static Future<NewPaymentMethodResult> open(BuildContext context) async =>
      (await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (c) => const NewPaymentMethodPage(),
        ),
      )) as NewPaymentMethodResult;

  Future<bool> _onPopScopeRequest(BuildContext context) async {
    Navigator.of(context).pop(NewPaymentMethodResult.canceled);
    return false;
  }

  _onStateChanged(BuildContext context, NewPaymentMethodState state) {
    if (state is NewPaymentMethodError) {
      Navigator.of(context).pop(NewPaymentMethodResult.failure);
    }
  }

  NavigationDecision _onNavigationRequest(
    BuildContext context,
    NavigationRequest request,
  ) {
    request.url;
    if (request.url == "/orderok.html") {
      Navigator.of(context).pop(NewPaymentMethodResult.success);
    } else if (request.url == "/orderNOok.html") {
      Navigator.of(context).pop(NewPaymentMethodResult.failure);
    }
    return NavigationDecision.navigate;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewPaymentMethodBloc(
        userRepository: context.read(),
      ),
      child: BlocConsumer<NewPaymentMethodBloc, NewPaymentMethodState>(
        listener: _onStateChanged,
        builder: (ctx, state) => state is NewPaymentMethodDisplayingUrl
            ? WebViewPage(
                popScopeNavigationDelegate: () => _onPopScopeRequest(context),
                webViewNavigationDelegate: (request) =>
                    _onNavigationRequest(context, request),
                appBar: titledAppBar(context,
                    title: context.l10n.legal_mentions_page),
                url: state.url)
            : const LoadingIndicator(),
      ),
    );
  }
}
