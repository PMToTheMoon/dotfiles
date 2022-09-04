A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.


class TripleStateView extends StatelessWidget {
  const TripleStateView({
    super.key,
    required this.state,
    required this.loading,
    required this.success,
    required this.error,
  });

  final Object state;
  final Widget Function(LoadingState) loading;
  final Widget Function(SuccessState) success;
  final Widget Function(ErrorState) error;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubjectBloc(),
      child: BlocConsumer<SubjectBloc, SubjectState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.map(
            loading: loading,
            success: success,
            error: error,
          );
        },
      ),
    );
  }
}