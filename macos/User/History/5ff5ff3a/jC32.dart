part of 'form.dart';

const formWidgetTemplate = '''
class {{ class }} extends StatefulWidget {
  const {{ class }}({
    super.key,
  });

  @override
  ObservationFormState createState() => ObservationFormState();
}

class ObservationFormState extends State<ObservationForm> {
  ObservationFormState();

  final _controller = ObservationFormController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller._formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "a",
              hintText: "a",
            ),
            controller: _controller.textFieldController,
            // validator: ,
          )
        ],
      ),
    );
  }
}
''';
