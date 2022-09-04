class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ErrorWidget(e ?? context.l10n.error_undefined);
  }
}
