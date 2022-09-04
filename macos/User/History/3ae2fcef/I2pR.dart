Future<String?> authGuard(_) async {
  final authState = context.read<AuthBloc>().state;
  return authState.mapOrNull(
    unauthenticated: (unauthenticated) => '/login',
  );
}
