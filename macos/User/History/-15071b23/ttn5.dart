import 'package:mustache_template/mustache_template.dart';

String renderTemplate(String source, Uri url, Map<String, dynamic> parameters) {
  final template = Template(source, name: 'template-filename.html');

  return template.renderString({
    'names': [
      {'firstname': 'Greg', 'lastname': 'Lowe'},
      {'firstname': 'Bob', 'lastname': 'Johnson'}
    ]
  });
}
