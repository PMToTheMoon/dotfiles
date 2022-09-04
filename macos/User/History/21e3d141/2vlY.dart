class ObservationCards extends StatelessWidget {
  const ObservationCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final recordCards = _buildObservationCardsFromData(observationsData)
        .intersperse(const SpaceSmaller.h());
    if (observationsData.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SpaceSmaller(),
        ...recordCards,
      ],
    );
  }
}
