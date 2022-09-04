mixin DynamicPage {
  static Future<void> open(BuildContext context, OTPPageArgs args) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OTPPage(
            args: args,
          ),
        ),
      );
}
