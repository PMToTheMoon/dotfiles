import 'package:chopper/chopper.dart';

extension UnwrapResponseExtension<T> on Response {
  T unwrapOrThrow(dynamic exception) {
    final T? data = body;
    if (isSuccessful && data != null) {
      return data;
    }
    throw exception;
  }
}
