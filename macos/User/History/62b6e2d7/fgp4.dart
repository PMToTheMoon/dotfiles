import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlView extends StatelessWidget {
  const HtmlView({
    required this.htmlText,
    super.key,
  });

  String htmlText;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlText,
      style: {
        "body": Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
        ),
      },
    );
  }
}
