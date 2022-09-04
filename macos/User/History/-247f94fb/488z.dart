// ignore_for_file: unused_element, always_declare_return_types

part of 'ui_kit_page.dart';

_buildForms() => <Widget>[
      FormSection(
        title: 'Titre du parcours',
        required: true,
        children: [
          MultiLineTextFormField(
            hint: 'Ecrire un motif ici',
          ),
          const SpaceSmall.h(),
          ChipEditorFormField(
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
