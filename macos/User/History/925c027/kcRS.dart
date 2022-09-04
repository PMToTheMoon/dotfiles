class Hub extends StatelessWidget {
  static Future<void> open(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const GeneralInitialObservationPage(),
        ),
      );

  const Hub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Hub');
  }
}

class _Hub extends StatelessWidget {
  const _Hub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('_Hub');
  }
}
