// ignore_for_file: always_declare_return_types

part of 'ui_kit_page.dart';

_buildBottomSheets(BuildContext context) => [
      ElevatedButton(
        onPressed: () {
          context.showZanalysBottomSheet(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Option 1')),
                ElevatedButton(onPressed: () {}, child: const Text("Option 2")),
                ElevatedButton(onPressed: () {}, child: const Text("Option 3")),
              ],
            ),
          );
        },
        child: Text("Show bottom sheet"),
      ),
    ];
