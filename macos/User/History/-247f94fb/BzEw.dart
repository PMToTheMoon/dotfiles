// ignore_for_file: unused_element, always_declare_return_types

part of 'ui_kit_page.dart';

_buildForms() => <Widget>[
      MultiLineTextFormField(
        hint: 'Ecrire un motif ici',
      ),
      const SpaceSmall.h(),
      const ChipEditor(
        label: 'Antécédents',
      ),
    ];
