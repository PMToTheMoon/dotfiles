import 'package:bonemeal/src/formatter.dart';
import 'package:logging/logging.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:path/path.dart';

final _log = Logger('Mustache');

/// Wrapper around mustache_template in case we want to change dep
String renderTemplate(String source, Uri url, Map<String, dynamic> parameters) {
  final template = Template(source, name: url.path, htmlEscapeValues: false);
  return template.renderString(parameters);
}

String renderDartTemplate(
  String source,
  Uri url,
  Map<String, dynamic> parameters,
) {
  try {
    final code = renderTemplate(source, url, parameters);
  } catch (e) {}
  return formatDartCode(code);
}
