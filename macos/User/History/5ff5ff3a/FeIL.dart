part of 'form.dart';

const formControllerTemplate = '''
class {{ class }} {
  {{ class }}([
    {{ snapshot.class }}? initialValue,
  ]) : textFieldController =
            TextEditingController(text: initialValue?.textField);

  final _formKey = GlobalKey<FormFieldState>();

  // controlled
  final TextEditingController textFieldController;

  // uncontrolled ?

  {{ snapshot.class }} snapshot() => const ObservationFormSnapshot();
  bool validate() => true;
}
''';

const formWidgetTemplate = '''
class {{ class }} extends StatefulWidget {
  const {{ class }}({
    this.onWillPop,
    this.onChanged,
    this.autovalidateMode,
    super.key,
  });

  final WillPopCallback? onWillPop;

  final VoidCallback? onChanged;

  final AutovalidateMode? autovalidateMode;

  @override
  {{ class }}State createState() => {{ class }}State();
}

class {{ class }}State extends State<{{ class }}> {
  {{ class }}State();

  final _controller = {{ controller.class }}();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      onWillPop: widget.onWillPop,
      autovalidateMode: widget.autovalidateMode,
      key: _controller._formKey,
      child: Column(
        children: [
          {{# fields }}
            {{.}},
          {{/ fields }}
        ],
      ),
    );
  }
}
''';
