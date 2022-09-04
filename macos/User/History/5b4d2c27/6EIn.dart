import 'package:flutter/material.dart' hide Page, MenuItem;
import 'package:common/common.dart';

const address1 = FavoriteAddress(
  id: 0,
  label: "rue de la soif",
  section: "section",
  type: AddressType.airport,
  address: "20",
  center: [0, 0],
);

const address2 = FavoriteAddress(
  id: 0,
  label: "rue de la paix",
  section: "section",
  type: AddressType.airport,
  address: "42",
  center: [0, 0],
);

class UiKitPage extends StatelessWidget {
  const UiKitPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page(
      appBar: logoAppBar(context),
      drawer: navigationDrawer(context, [
        MenuItem.pageLink(
          context,
          icon: Icons.person,
          label: "label",
          route: "na",
        ),
        MenuItem.pageLink(
          context,
          icon: Icons.person,
          label: "label",
          route: "na",
        ),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...trip,
          const Space1.h(),
          ...textFields,
          const Space1.h(),
          ...buttons,
        ],
      ),
    );
  }

  List<Widget> get trip => [
        // TripTabBar(
        //   selected: TripTab.incoming,
        //   onSelect: (_) {},
        // ),
        const Space3.h(),
        TripCard(
          Trip(
            id: 0,
            status: TripStatus.completed,
            departure: address1,
            arrival: address2,
            date: DateTime.now(),
            price: 22,
            vehicle: Vehicle.berlin,
          ),
        ),
        const Space3.h(),
        Row(
          children: const [
            TripStatusTag(TripStatus.waitingPayment),
            TripStatusTag(TripStatus.completed),
            TripStatusTag(TripStatus.canceled),
            TripStatusTag(TripStatus.payed),
          ],
        ),
        const Space3.h(),
        TripAddressesDisplay(
          departure: address1.label,
          arrival: address2.label,
        ),
      ];

  List<Widget> get textFields => [
        const TextField(
          decoration: InputDecoration(
            labelText: "label",
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            hintText: "alarm",
            labelText: "label",
            icon: Icon(Icons.access_alarm),
            prefixIcon: Icon(Icons.access_alarm),
            suffixIcon: Icon(Icons.access_alarm),
          ),
        ),
      ];

  List<Widget> get buttons => [
        Button.primary("primary", () {}),
        Button.secondary("secondary", () {}),
        Button.secondary("secondary", () {},
            rightIcon: const Icon(Icons.ac_unit)),
        Button.secondary("secondary", () {},
            leftIcon: const Icon(Icons.ac_unit)),
        Button.secondary("secondary", () {},
            rightIcon: const Icon(Icons.ac_unit),
            leftIcon: const Icon(Icons.ac_unit)),
        Button.primary("primary", () {}, expands: true),
        Button.secondary("secondary", () {}, expands: true),
        Button.secondary("secondary", () {},
            rightIcon: const Icon(Icons.ac_unit), expands: true),
        Button.secondary("secondary", () {},
            leftIcon: const Icon(Icons.ac_unit), expands: true),
        Button.secondary("secondary", () {},
            rightIcon: const Icon(Icons.ac_unit),
            leftIcon: const Icon(Icons.ac_unit),
            expands: true),
        Button.secondary("super long label secondary", () {},
            rightIcon: const Icon(Icons.ac_unit),
            leftIcon: const Icon(Icons.ac_unit),
            expands: true),
        SizedBox(
          width: 110,
          child: Button.secondary("secondary", () {},
              rightIcon: const Icon(Icons.ac_unit),
              leftIcon: const Icon(Icons.ac_unit),
              expands: true),
        ),
      ];
}
