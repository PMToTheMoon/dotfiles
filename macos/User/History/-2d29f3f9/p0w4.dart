part of 'reservation_form.dart';

class _Price extends StatelessWidget {
  const _Price({
    Key? key,
  }) : super(key: key);

  String _vehicle(BuildContext context, ReservationState state) {
    if (state.vehicle == Vehicle.berlin) {
      return context.l10n.berlin;
    } else {
      return context.l10n.motorcycle;
    }
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
            children: [
              TextSpan(
                text: context.l10n.estimation_price_suffix,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
              TextSpan(
                text: _vehicle(context, state),
                style: const TextStyle(fontWeight: FontWeight.bold),
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