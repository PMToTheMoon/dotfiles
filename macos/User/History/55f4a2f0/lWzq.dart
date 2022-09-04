import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class FormTest extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Form(
      subject: 'Form',
      parts: [
        TextFormField('name'),
        TextFormField('name'),
      ],
    );
  }
}
