import 'package:flutter_bloc/flutter_bloc.dart';

class TripleStateView extends StatelessWidget {
  const TripleStateView({
    super.key,
    required this.state,
    required this.loading,
    required this.success,
    required this.error,
  });

  final Object state;
  final Widget Function(BuildContext context, LoadingState) onLoading;
  final Widget Function(BuildContext context, SuccessState) onSuccess;
  final Widget Function(BuildContext context, ErrorState) onError;
  final Widget Function(BuildContext context, LoadingState) loading;
  final Widget Function(BuildContext context, SuccessState) success;
  final Widget Function(BuildContext context, ErrorState) error;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => {
        {bloc.invocation}
      },
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
