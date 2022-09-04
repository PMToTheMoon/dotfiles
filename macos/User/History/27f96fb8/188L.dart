import 'package:bonemeal/bonemeal.dart';
import 'package:mustache_template/mustache_template.dart';

/// Wrapper around mustache_template in case we want to change dep
String _renderTemplate(
    String source, Uri url, Map<String, dynamic> parameters) {
  final template = Template(source, name: url.path, htmlEscapeValues: false);
  return template.renderString(parameters);
}

String renderTemplate(
  String source,
  String url,
  Map<String, dynamic> parameters, {
  bool format = false,
}) {
  late String code;
  try {
    code = _renderTemplate(source, url, parameters);
  } catch (e) {
    rethrow;
  }
  if (format) {
    return formatter.format(code);
  } else {
    return code;
  }
}
