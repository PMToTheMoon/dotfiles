import 'package:chopper/chopper.dart';

extension UnwrapResponseExtension<T> on Response<T> {
  T unwrapOrThrow(dynamic exception) {
    final T? data = this.body;
    if (isSuccessful && data != null) {
      return data;
    }
    throw exception;
  }

  T unwrapOrThrow(dynamic exception) {
    final T? data = this.body;
    if (isSuccessful && data != null) {
      return data;
    }
    throw exception;
  }
}
