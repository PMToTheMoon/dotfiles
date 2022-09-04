part of 'reservation_form.dart';

class _Price extends StatelessWidget {
  const _Price({
    Key? key,
  }) : super(key: key);

  String get suffix(BuildContext context, ReservationState state) {
    late final String vehicle;
    if (state.vehicle == Vehicle.berlin) {
      vehicle = context.l10n.berlin;
    } else {
      vehicle = context.l10n.moto;
    }
    "berlin": "Berline",
    "motorcycle": "Moto",
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((ReservationBloc bloc) => bloc.state);
    late Widget content;
    if (state.displayLoadingPrice) {
      content = const Center(
        child: SizedBox(
          height: Dimensions.icon2,
          width: Dimensions.icon2,
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state.displayPrice) {
      final estimate = state.estimate!;
      content = Text.rich(
        TextSpan(
            text: "${estimate.price.toStringAsFixed(2)} ${estimate.currency}",
            style: const TextStyle(fontWeight: FontWeight.bold),
            children: const [
              TextSpan(
                text: " ${context.l10n.estimation_price_suffix(state.vehicle.)}",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ]),
        textAlign: TextAlign.center,
      );
    } else {
      return const SizedBox.shrink();
    }

    return Container(
      color: ub.Colors.mediumGray,
      margin: const Padding5(bottom),
      child: Padding(
        padding: const Padding5.all(),
        child: content,
      ),
    );
  }
}
