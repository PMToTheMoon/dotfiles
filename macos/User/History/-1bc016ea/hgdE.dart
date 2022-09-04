enum LoadedListStatus { loading, loaded, error }

class LoadedList<T> extends StatelessWidget {
  const LoadedList({
    super.key,
  });

  final LoadedListStatus status;

  @override
  Widget build(BuildContext context) {
    return const Text('LoadedList');
  }
}
