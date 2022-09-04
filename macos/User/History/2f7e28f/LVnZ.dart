import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:neat/neat.dart';

export 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    this.onWebViewCreated,
    this.navigationDelegate,
    this.appBar,
    this.url,
    Key? key,
  }) : super(key: key);

  WebViewPage.withBackButton({
    this.onWebViewCreated,
    this.navigationDelegate,
    required VoidCallback? onAppBarBackButtonPressed,
    required Widget title,
    this.url,
    Key? key,
  })  : appBar = AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onAppBarBackButtonPressed,
          ),
          title: title,
        ),
        super(key: key);

  final void Function(WebViewController)? onWebViewCreated;
  final Future<bool> Function()? navigationDelegate;
  final AppBar? appBar;
  final String? url;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  _WebViewPageState();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.navigationDelegate,
      child: Scaffold(
        appBar: widget.appBar,
        body: SafeArea(
          child: Stack(
            children: [
              WebView(
                onWebViewCreated: widget.onWebViewCreated,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: widget.url,
                onPageFinished: (_) => setState(() {
                  isLoading = false;
                }),
              ),
              if (isLoading)
                Container(
                  color: context.colorScheme.background,
                  child: const LoadingIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
