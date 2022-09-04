// ignore_for_file: always_declare_return_types

part of 'ui_kit_page.dart';

_buildButtons() => [
      ElevatedButton(onPressed: () {}, child: Text("Elevated")),
      OutlinedButton(onPressed: () {}, child: Text("Outlined")),
      HighlightedOutlinedButton(
          onPressed: () {}, child: Text("HighligtedOutlined")),
    ];
