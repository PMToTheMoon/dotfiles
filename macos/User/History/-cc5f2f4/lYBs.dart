import 'package:chopper/chopper.dart';

extension UnwrapResponseExtension<T> on Response<T> {
  T unwrapOrThrow(dynamic exception) {
    final T? data = this.body;
    if (isSuccessful && data != null) {
      return data;
    }
    throw exception;
  }

  T unwrapOr(T Function(Response<T>) onError) {
    final T? data = this.body;
    if (isSuccessful && data != null) {
      return data;
    }
    return onError(this);
  }
}
