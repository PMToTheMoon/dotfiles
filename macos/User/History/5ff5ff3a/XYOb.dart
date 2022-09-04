part of 'form.dart';

const formWidgetTemplate = '''
class ObservationForm extends StatefulWidget {
  const ObservationForm({
    this.onWillPop,
    this.onChanged,
    this.autovalidateMode,
    super.key,
  });

  final WillPopCallback? onWillPop;

  final VoidCallback? onChanged;
  
  final AutovalidateMode? autovalidateMode;

  @override
  ObservationFormState createState() => ObservationFormState();
}

class ObservationFormState extends State<ObservationForm> {
  ObservationFormState();

  final _controller = ObservationFormController();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      onWillPop: widget.onWillPop,
      autovalidateMode: widget.autovalidateMode,
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
