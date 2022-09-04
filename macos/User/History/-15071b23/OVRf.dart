import 'package:mustache_template/mustache_template.dart';

String renderTemplate(String source, Uri url, Map<String, dynamic> parameters) {
  final template = Template(source, name: url.path);
  return template.renderString(parameters);
}
