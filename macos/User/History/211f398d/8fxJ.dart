import 'package:common/common.dart';
import 'package:flutter/material.dart';

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

  NavigationDecision _onNavigationRequest(NavigationRequest request) {
    request.url;
    if (request.url == "/orderok.html") {
    } else if (request.url == "orderNOok.html") {}
    return NavigationDecision.navigate;
  }

  @override
  Widget build(BuildContext context) {
    return WebViewPage(
      popScopeNavigationDelegate: () => _onPopScopeRequest(context),
      webViewNavigationDelegate: _onNavigationRequest,
      appBar: titledAppBar(context, title: context.l10n.legal_mentions_page),
      url: "",
    );
  }
}
