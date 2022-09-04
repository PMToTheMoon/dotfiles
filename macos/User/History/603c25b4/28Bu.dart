import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_section/form_section.dart';

mixin HeaderSection {
  FormSectionMetaData build(BuildStep step) {}
}

class TitleSection = FormSection with HeaderSection;
