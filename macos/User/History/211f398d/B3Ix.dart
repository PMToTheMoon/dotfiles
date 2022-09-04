import 'package:common/common.dart';
import 'package:flutter/material.dart';

class NewPaymentMethodPage extends StatefulWidget {
  const NewPaymentMethodPage({
    Key? key,
  }) : super(key: key);

  @override
  _NewPaymentMethodPageState createState() => _NewPaymentMethodPageState();
}

class _NewPaymentMethodPageState extends State<NewPaymentMethodPage> {
  _NewPaymentMethodPageState();

  late WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return WebViewPage(
      onWebViewCreated: (controller) => _controller = controller,
      appBar: titledAppBar(context, title: context.l10n.legal_mentions_page),
      url: "",
    );
  }
}
