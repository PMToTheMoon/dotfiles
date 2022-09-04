class Shimmer extends StatelessWidget {
  const Shimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ext.Shimmer.fromColors(
      baseColor: AppColors.lightGray,
      highlightColor: AppColors.white,
      period: Feel.durationLong,
      enabled: enabled,
      child: child,
    );
  }
}
