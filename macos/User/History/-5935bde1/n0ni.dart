import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

typedef Wrapper = Expression Function(List<FormFieldMetaData> fields);

class WrappedFormSection extends FormSection {}
