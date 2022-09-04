import 'dart:async';
import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

export 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    this.onWebViewCreated,
    this.popScopeNavigationDelegate,
    this.webViewNavigationDelegate,
    this.appBar,
    this.url,
    Key? key,
  })  : _createAppBar = false,
        super(key: key);

  WebViewPage.withBackButton({
    this.onWebViewCreated,
    this.popScopeNavigationDelegate,
    this.webViewNavigationDelegate,
    required VoidCallback? onAppBarBackButtonPressed,
    required Widget title,
    this.url,
    Key? key,
  })  : appBar = null,
        _createAppBar = true,
        super(key: key);

  final bool _createAppBar;
  final void Function(WebViewController)? onWebViewCreated;
  final Future<bool> Function()? popScopeNavigationDelegate;
  final FutureOr<NavigationDecision> Function(NavigationRequest)?
      webViewNavigationDelegate;
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
      onWillPop: widget.popScopeNavigationDelegate,
      child: Scaffold(
        appBar: widget.appBar,
        body: SafeArea(
          child: Stack(
            children: [
              WebView(
                navigationDelegate: widget.webViewNavigationDelegate,
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
