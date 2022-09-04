import 'package:common/common.dart';
import 'package:flutter/material.dart';

class NewPaymentMethodPage extends StatelessWidget {
  const NewPaymentMethodPage({
    Key? key,
  }) : super(key: key);

  _onNavigationRequest(NavigationRequest request) {
    request.url;
    if (request.url == "/orderok.html") {
    } else if (request.url == "orderNOok.html") {}
  }

  @override
  Widget build(BuildContext context) {
    return WebViewPage(
      webViewNavigationDelegate: _onNavigationRequest,
      appBar: titledAppBar(context, title: context.l10n.legal_mentions_page),
      url: "",
    );
  }
}
