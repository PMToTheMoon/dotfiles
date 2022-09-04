import 'package:common/common.dart';
import 'package:common/src/ui_kit/buttons.dart';
import 'package:common/src/ui_kit/checkboxes.dart';
import 'package:common/src/ui_kit/fields.dart';
import 'package:common/src/ui_kit/notifications.dart';
import 'package:common/src/ui_kit/switches.dart';
import 'package:common/src/ui_kit/texts.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:popover/popover.dart';

import 'radios.dart';

class UiKitPage extends StatelessWidget {
  static const route = 'ui_kit';
  static Widget builder(BuildContext context) => const UiKitPage();

  const UiKitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TbtMenuBar(
          children: [
            const TbtMenuSectionTitle('GENERAL'),
            TbtMenuLink(Icons.table_chart_rounded, 'Dashboard', onTap: () {}),
            TbtMenuLink(Icons.library_add_check_rounded, 'Cooptations',
                onTap: () {}),
            const TbtMenuDivider(),
          ],
        ),
        Expanded(
          child: Scaffold(
            appBar: const TbtAppBar(
              notificationNumber: 1,
              avatar: NetworkImage(
                'https://img.freepik.com/free-photo/dreamy-young-woman-sunglasses-looking-front_197531-16739.jpg',
              ),
            ),
            body: SingleChildScrollView(
              controller: ScrollController(),
              child: Padding(
                padding: const PaddingPage(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...texts(context),
                    const SpaceMedium(),
                    ...fields(),
                    const SpaceMedium(),
                    Row(children: buttons()),
                    const SpaceMedium(),
                    Row(children: checkboxes()),
                    const SpaceMedium(),
                    radios(),
                    const SpaceMedium(),
                    switches(),
                    const SpaceMedium(),
                    notifictaion(),
                    const SpaceMedium(),
                    Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {
                          showPopover(
                            context: context,
                            bodyBuilder: (context) => Container(
                              height: 100,
                              width: 100,
                              color: context.colorScheme.primary,
                              child: Text("Test"),
                            ),
                          );
                        },
                        child: Text("show profile popver"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
