import 'package:bonemeal/src/formatter.dart';
import 'package:mustache_template/mustache_template.dart';

/// Wrapper around mustache_template in case we want to change dep
String renderTemplate(
  String source,
  String name,
  Map<String, dynamic> parameters,
) {
  final template = Template(source, name: name, htmlEscapeValues: false);
  return template.renderString(parameters);
}

String renderDartTemplate(
  String source,
  String name,
  Map<String, dynamic> parameters,
) =>
    formatDartCode(renderTemplate(source, name, parameters));
