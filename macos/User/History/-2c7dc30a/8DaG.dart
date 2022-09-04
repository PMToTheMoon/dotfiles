import 'package:freezed_annotation/freezed_annotation.dart';

part 'test.freezed.dart';

@freezed
class Test with _$Test {
  const Test._();

  const factory Test.() = _Test;
}