// ignore_for_file: always_declare_return_types

part of 'ui_kit_page.dart';

_buildChips() => [
      Wrap(
        spacing: Dimensions.spaceSmaller,
        children: const [
          ColoredChip.blue('Blue'),
          ColoredChip.green('Green'),
          ColoredChip.orange('Orange'),
          ColoredChip.red('Red'),
        ],
      )
    ];
