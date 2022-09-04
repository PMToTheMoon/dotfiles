part of 'home_page.dart';

const double _kHeight = Dimensions.icon1;
const double _kPinSize = 14;

class _DriveAlert extends StatelessWidget {
  const _DriveAlert({
    this.onTap,
    required this.incomingReservation,
    Key? key,
  }) : super(key: key);

  final int incomingReservation;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: _kPinSize / 4,
            top: _kPinSize / 4,
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 2,
                color: context.theme.dividerColor,
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              splashColor: context.colorScheme.primary.withAlpha(54),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 8,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.event_available,
                      size: Dimensions.icon3,
                    ),
                    Text(
                      "Réservations",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(_kPinSize),
            ),
            width: _kPinSize,
            height: _kPinSize,
            padding: const EdgeInsets.all(_kPinSize * .382 / 2),
            child: FittedBox(
              child: Text(
                "$incomingReservation",
                style: TextStyle(
                  color: context.colorScheme.surface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
