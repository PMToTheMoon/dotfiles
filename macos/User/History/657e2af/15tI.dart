import 'package:flutter/material.dart';

mixin DynamicPage<Arg, Result> {
  static Future<Result> open(BuildContext context, Arg args) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OTPPage(
            args: args,
          ),
        ),
      );
}
