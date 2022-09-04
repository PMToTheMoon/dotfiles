import 'package:bonemeal/bonemeal.dart';
import 'package:mustache_template/mustache_template.dart';

/// Wrapper around mustache_template in case we want to change dep
String _renderTemplate(
    String source, Uri url, Map<String, dynamic> parameters) {
  final template = Template(source, name: url.path, htmlEscapeValues: false);
  return template.renderString(parameters);
}

String renderDartTemplate(
  String source,
  Uri url,
  Map<String, dynamic> parameters,
) {
  late String code;
  try {
    code = renderTemplate(source, url, parameters);
  } catch (e) {
    rethrow;
  }
  return formatter.format(code);
}
