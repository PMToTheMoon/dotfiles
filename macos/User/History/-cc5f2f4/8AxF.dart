import 'package:chopper/chopper.dart';

extension UnwrapResponseExtension<T> on Response<T> {
  T unwrapOrThrow(dynamic exception) {
        final user = response.body;
    if (response.isSuccessful && user != null) {
      return user;
    }
    throw 'Unable to fetch'
  }
  }
}