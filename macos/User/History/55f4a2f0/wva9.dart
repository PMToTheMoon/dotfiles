import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class FormTest extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Form(
      subject: 'test',
      parts: [
        TextFormField('textField'),
        IntFormField('intField'),
        DoubleFormField('doubleField'),
      ],
    );
  }
}
