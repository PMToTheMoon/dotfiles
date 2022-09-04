import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlView extends StatelessWidget {
  const HtmlView({
    required this.htmlText,
    super.key,
  });

  final String htmlText;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlText,
      shrinkWrap: true,
      style: {
        'body': Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          fontSize: FontSize.medium,
          fontWeight: FontWeight.w300,
        ),
        'h1': Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          fontSize: FontSize.medium,
          fontWeight: FontWeight.w300,
        ),
        'h2': Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          fontSize: FontSize.medium,
          fontWeight: FontWeight.w300,
        ),
        'h3': Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          fontSize: FontSize.medium,
          fontWeight: FontWeight.w300,
        ),
        'h4': Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          fontSize: FontSize.medium,
          fontWeight: FontWeight.w300,
        ),
        'h5': Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          fontSize: FontSize.medium,
          fontWeight: FontWeight.w300,
        ),
        'h6': Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          fontSize: FontSize.medium,
          fontWeight: FontWeight.w300,
        ),
        'p': Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          fontSize: FontSize.medium,
          fontWeight: FontWeight.w300,
        ),
      },
    );
  }
}
