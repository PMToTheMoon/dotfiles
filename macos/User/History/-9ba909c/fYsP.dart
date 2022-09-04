import 'package:common/common.dart';
import 'package:common/src/ui_kit/buttons.dart';
import 'package:common/src/ui_kit/checkboxes.dart';
import 'package:common/src/ui_kit/fields.dart';
import 'package:common/src/ui_kit/notifications.dart';
import 'package:common/src/ui_kit/switches.dart';
import 'package:common/src/ui_kit/texts.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'radios.dart';

class UiKitPage extends StatelessWidget {
  static const route = 'ui_kit';
  static Widget builder(BuildContext context) => const UiKitPage();

  const UiKitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: const TbtAppBar(
          notificationNumber: 1,
          avatar: NetworkImage(
            'https://img.freepik.com/free-photo/dreamy-young-woman-sunglasses-looking-front_197531-16739.jpg',
          ),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 241,
              child: Material(
                color: context.colorScheme.tertiary,
                child: ListView(
                  children: [
                    DrawerHeader(child: context.displayMedium("TechByTech")),
                    ListTile(
                      title: Text("item"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
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
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Color(0xffF3F3F4),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
