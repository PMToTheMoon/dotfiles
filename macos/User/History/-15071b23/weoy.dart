import 'package:bonemeal/src/formatter.dart';
import 'package:mustache_template/mustache_template.dart';

/// Wrapper around mustache_template in case we want to change dep
String renderTemplate(String source, Uri url, Map<String, dynamic> parameters) {
  final template = Template(source, name: url.path);
  return template.renderString(parameters);
}

String renderDartTemplate(
  String source,
  Uri url,
  Map<String, dynamic> parameters,
) =>
    formatDartCode(renderTemplate(source, url, parameters));
