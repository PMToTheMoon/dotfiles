class IconTextChip extends StatelessWidget {
  const IconTextChip(
 {
    super.key,
  })

  final Widget child;
  final Color backgroundColor;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: borderRadius,
      ),
      padding: padding,
      child: IconText(icon, text),
    );
  }
}
