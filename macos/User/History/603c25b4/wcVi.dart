import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_section/form_section.dart';

const headerSectionTemplate = '''
  
''';

class HeaderSection extends FormSection {
  HeaderSection({
    required super.spacing,
    required super.fields,
  });

  FormSectionMetaData build(BuildStep step) {}
}
