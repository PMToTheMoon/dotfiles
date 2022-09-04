part of 'form.dart';

const formControllerTemplate = '''
class {{ class }} {
  {{ class }}([
    {{ snapshot.class }}? initialValue,
  ]) : {{ initializations }};

  final _formKey = GlobalKey<FormFieldState>();

  {{# fields }}
  final {{ class }} {{ name }};
  {{/ fields }}

  {{ snapshot.class }} snapshot() => {{snapshot.class}}(
    {{# fields }}
    {{name}}: {{value}},
    {{/ fields }}
  );
}
''';

const formWidgetTemplate = '''
class {{ class }} extends StatefulWidget {
  const {{ class }}({
    this.onWillPop,
    this.onChanged,
    this.autovalidateMode,
    this.spacing,
    this.controller,
    super.key,
  }) : spacing = spacing ?? const SizedBox.shrink();

  final WillPopCallback? onWillPop;

  final VoidCallback? onChanged;

  final AutovalidateMode? autovalidateMode;

  final Widget spacing;

  final GeneralInitialObservationFormController? controller;

  @override
  {{ class }}State createState() => {{ class }}State();
}

class {{ class }}State extends State<{{ class }}> {
  {{ class }}State();

  late final _controller =
      widget.controller ?? {{ controller.class }}();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: widget.onChanged,
      onWillPop: widget.onWillPop,
      autovalidateMode: widget.autovalidateMode,
      key: _controller._formKey,
      child: Column(
        children: [
          {{ fields }}
        ],
      ),
    );
  }
}
''';
