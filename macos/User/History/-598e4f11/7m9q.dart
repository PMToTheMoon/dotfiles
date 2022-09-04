class CompleteRecordButton extends StatelessWidget {
  const CompleteRecordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingLarge.vertical(),
      child: HighlightedOutlinedButton(
        onPressed: _onCompleteRecordPressed,
        child: Text(context.l10n.hub_complete_button),
      ),
    );
  }
}
