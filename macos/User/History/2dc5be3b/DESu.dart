// ignore_for_file: always_declare_return_types

part of 'ui_kit_page.dart';

_buildBottomSheets(BuildContext context) => [
      ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => ZanalysBottomSheet(),
          );
        },
        child: Text("Show bottom sheet"),
      ),
    ];
