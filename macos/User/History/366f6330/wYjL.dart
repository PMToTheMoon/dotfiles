import 'package:common/common.dart';
import 'package:common/src/ui_kit/buttons.dart';
import 'package:common/src/ui_kit/cards.dart';
import 'package:common/src/ui_kit/checkboxes.dart';
import 'package:common/src/ui_kit/chips.dart';
import 'package:common/src/ui_kit/fields.dart';
import 'package:common/src/ui_kit/forms.dart';
import 'package:common/src/ui_kit/identities.dart';
import 'package:common/src/ui_kit/menu_bar.dart';
import 'package:common/src/ui_kit/notifications.dart';
import 'package:common/src/ui_kit/switches.dart';
import 'package:common/src/ui_kit/tab_bars.dart';
import 'package:common/src/ui_kit/texts.dart';
import 'package:common/src/ui_kit/unfoldable.dart';
import 'package:flutter/material.dart';

import 'radios.dart';

class UiKitPage extends StatelessWidget {
  static const route = 'ui_kit';
  static Widget builder(BuildContext context) => const UiKitPage();

  const UiKitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Padding(
        padding: const PaddingPage(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Test(),
            const SpaceLarge(),
            ...fields(),
            const SpaceMedium(),
            ...forms(context),
            const SpaceMedium.h(),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: buttons(),
            ),
            ...identities(context),
            const SpaceMedium.h(),
            ...chips(context),
            const SpaceMedium(),
            ...tabBars(context),
            const SpaceMedium(),
            ...unfoldables(context),
            const SpaceMedium(),
            ...cards(context),
            const SpaceMedium(),
            ...texts(context),
            const SpaceMedium(),
            const SpaceMedium(),
            Wrap(children: checkboxes()),
            const SpaceMedium(),
            radios(),
            const SpaceMedium(),
            switches(),
            const SpaceMedium(),
            notifictaion(),
            const SpaceMedium(),
          ],
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry A')),
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[200],
              child: const Center(child: Text('Entry B')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[300],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({
    super.key,
  });

  @override
  TestState createState() => TestState();
}

class TestState extends State<Test> {
  TestState();

  final _ctrl = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            controller: _ctrl,
          ),
          ElevatedButton(
            onPressed: () {
              _key.currentState?.reset();
            },
            child: Text("reset"),
          ),
        ],
      ),
    );
  }
}
