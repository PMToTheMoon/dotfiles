import 'package:chopper/chopper.dart';

extension UnwrapResponseExtension<T> on Response<T> {
  T unwrapOrThrow(dynamic exception) {
        final data = body;
    if (isSuccessful && data != null) {
      return user;
    }
    throw 'Unable to fetch'
  }
  }
}