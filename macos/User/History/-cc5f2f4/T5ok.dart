import 'package:chopper/chopper.dart';

extension UnwrapResponseExtension<T> on Response {
  T unwrapOrThrow(dynamic exception) {
    body;
    if (isSuccessful && data != null) {
      return data;
    }
    throw exception;
  }
}
