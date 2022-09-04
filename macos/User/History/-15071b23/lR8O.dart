import 'package:mustache_template/mustache_template.dart';

String renderTemplate(String source, Uri url, Map<String, dynamic> parameters) {
  var template = new Template(source, name: 'template-filename.html');

  var output = template.renderString({
    'names': [
      {'firstname': 'Greg', 'lastname': 'Lowe'},
      {'firstname': 'Bob', 'lastname': 'Johnson'}
    ]
  });
}
