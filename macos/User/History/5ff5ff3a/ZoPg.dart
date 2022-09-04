part of 'form.dart';

const formControllerTemplate = '''
class {{ class }} {
  {{ class }}([
    {{ snapshot.class }}? initialValue,
  ]) : {{ fields.initializations }};

  final _formKey = GlobalKey<FormFieldState>();

  // controller
  {{# fields }}
  final {{ class }} {{ name }};
  {{/ fields }}

  // uncontrolled ?

  {{ snapshot.class }} snapshot() => {{snapshot.class}}(
    {{# fields }}
    {{field.name}}: {{field.value}}
    {{/ fields }}
  );
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
