// ignore_for_file: unused_element, always_declare_return_types

part of 'ui_kit_page.dart';

_buildForms() => <Widget>[
      FormSection(
        title: 'Titre du parcours',
        children: [
          MultiLineTextFormField(
            hint: 'Ecrire un motif ici',
          ),
          const SpaceSmall.h(),
          const ChipEditor(
            label: 'Antécédents',
          ),
        ],
      ),
      const SpaceSmall.h(),
      const Align(
        alignment: Alignment.centerRight,
        child: RequiredChip(),
      ),
    ];
